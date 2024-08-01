part of 'coupon_bloc.dart';

enum CouponListStatus { initial, loading, success, failure }

class CouponState extends Equatable {
  final CouponListStatus status;
  final List<CouponDataEntity> couponList;
  final String? errorMessage;

  const CouponState({
    this.status = CouponListStatus.initial,
    this.couponList = const [],
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        couponList,
        errorMessage,
      ];

  CouponState copyWith({
    CouponListStatus? status,
    List<CouponDataEntity>? couponList,
    List<CouponDataEntity>? couponOriginalList,
    String? errorMessage,
  }) {
    return CouponState(
      status: status ?? this.status,
      couponList: couponList ?? this.couponList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
