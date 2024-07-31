import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'coupon_data_entity.dart';

part 'coupons_entity.g.dart';

@CopyWith()
class CouponsEntity extends Equatable {
  final String status;
  final List<CouponDataEntity> couponDataEntity;
  final dynamic subscribedPackage;

  const CouponsEntity({
    required this.status,
    required this.couponDataEntity,
    required this.subscribedPackage,
  });

  @override
  List<Object?> get props => [
        status,
        couponDataEntity,
        subscribedPackage,
      ];
}
