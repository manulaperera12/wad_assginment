part of 'coupon_bloc.dart';

abstract class CouponEvent extends Equatable {
  const CouponEvent();
}

class InitialCouponListEvent extends CouponEvent {
  final bool isRefresh;

  const InitialCouponListEvent({this.isRefresh = false});

  @override
  List<Object> get props => [isRefresh];
}

class GetCouponList extends CouponEvent {
  final CouponsEntity couponsEntity;
  final CouponDataEntity couponDataEntity;

  const GetCouponList({
    required this.couponsEntity,
    required this.couponDataEntity,
  });

  @override
  List<Object> get props => [couponsEntity, couponDataEntity];
}
