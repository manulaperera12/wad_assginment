import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wad_assignment_manula/core/blocs/event_transformer.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entity/company_entity.dart';
import '../../domain/entity/vendor_profile_coupons_entity.dart';
import '../../domain/entity/vendor_profile_entity.dart';
import '../../domain/usecase/vendor_profile_usecase.dart';

part 'vendor_profile_event.dart';

part 'vendor_profile_state.dart';

class VendorProfileBloc extends Bloc<VendorProfileEvent, VendorProfileState> {
  final VendorProfileUseCase vendorProfileUseCase;

  VendorProfileBloc({required this.vendorProfileUseCase})
      : super(const VendorProfileState(vendorProfileStatus: VendorProfileStatus.initial)) {
    on<InitialVendorProfileEvent>(_openInitialVendorProfileEvent, transformer: Transformer.throttleDroppable());
  }

  Future<void> _openInitialVendorProfileEvent(InitialVendorProfileEvent event, Emitter<VendorProfileState> emit) async {
    if (event.isRefresh) {
      emit(state.copyWith(vendorProfileStatus: VendorProfileStatus.loading));
    }

    Either<Failure, VendorProfileEntity> result = await vendorProfileUseCase(event.parentCompanyId);
    result.fold(
      (failure) {
        String message = '';
        if (failure is ServerFailure) {
          message = failure.message;
        } else if (failure is NoConnectionFailure) {
          message = 'No Connection';
        } else {
          message = 'Data Fetch Failed';
        }
        emit(state.copyWith(
          vendorProfileStatus: VendorProfileStatus.failure,
          errorMessage: message,
        ));
      },
      (data) {
        emit(state.copyWith(
          vendorProfileStatus: VendorProfileStatus.success,
          companyList: data.companyDataEntity.companyEntity,
          couponsList: data.companyDataEntity.couponsEntity,
        ));
      },
    );
  }
}
