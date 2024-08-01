import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wad_interview_test/core/blocs/event_transformer.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entity/vendor/vendor_entity.dart';
import '../../../domain/usecase/vendor/vendor_usecase.dart';

part 'vendor_event.dart';

part 'vendor_state.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  final VendorUseCase vendorUseCase;

  VendorBloc({required this.vendorUseCase}) : super(const VendorState()) {
    on<GetVendorEventDataEvent>(_onGetVendorEventDataEvent, transformer: Transformer.throttleDroppable());
  }

  Future<void> _onGetVendorEventDataEvent(GetVendorEventDataEvent event, Emitter<VendorState> emit) async {
    if (event.isRefresh) {
      emit(state.copyWith(
        status: VendorStatus.loading,
      ));
    }

    final result = await vendorUseCase(NoParams());
    result.fold(
      (failure) {
        String message = '';
        if (failure is ServerFailure) {
          message = failure.message;
        } else if (failure is NoConnectionFailure) {
          message = "Check your internet connection";
        } else {
          message = "Data fetch failed";
        }
        emit(state.copyWith(
          status: VendorStatus.failure,
          errorMessage: message,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: VendorStatus.success,
          vendorEntity: data,
        ));
      },
    );
  }
}
