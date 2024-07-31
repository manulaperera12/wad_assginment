import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wad_interview_test/core/blocs/event_transformer.dart';
import 'package:wad_interview_test/features/explore/domain/entity/coupons/coupons_entity.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entity/coupons/coupon_data_entity.dart';
import '../../../domain/usecase/coupon/coupon_usecase.dart';


part 'coupon_event.dart';
part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {
  final GetCouponUseCase couponUseCase;

  // CouponBloc({required this.couponUseCase}) : super(const CouponState(status: CouponListStatus.initial)) {
  //   on<InitialCouponListEvent>(_openInitialCouponListEvent, transformer: Transformer.throttleDroppable());
  // }

  CouponBloc({
    required this.couponUseCase,
  }) : super(const CouponState(
    status: CouponListStatus.initial,
  )) {
    on<InitialCouponListEvent>(_openInitialCouponListEvent, transformer: Transformer.throttleDroppable());
    // on<GetCouponList>(_getCouponList, transformer: Transformer.throttleRestartable());
  }

  Future<FutureOr<void>> _openInitialCouponListEvent(InitialCouponListEvent event, Emitter<CouponState> emit) async {
    if (event.isRefresh) {
      emit(state.copyWith(
        status: CouponListStatus.loading,
      ));
    }

    Either<Failure, CouponsEntity> result = await couponUseCase(NoParams());
    result.fold(
          (failure) {
        String message = '';
        if (failure is ServerFailure) {
          message = failure.message;
        } else if (failure is NoConnectionFailure) {
          message = "No Connection";
        } else {
          message = "Data Fetch Failed";
        }
        emit(state.copyWith(
          status: CouponListStatus.failure,
          errorMessage: message,
        ));
      },
          (dataList) {
        emit(state.copyWith(
          status: CouponListStatus.success,
          couponList: dataList.couponDataEntity,
        ));
      },
    );
  }

}
