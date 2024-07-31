import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package_data_entity.dart';

part 'coupon_packages_data_entity.g.dart';

@CopyWith()
class CouponPackagesDataEntity extends Equatable {
  final int id;
  final int couponId;
  final int packageId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;
  final PackageDataEntity packageDataEntity;

  const CouponPackagesDataEntity({
    required this.id,
    required this.couponId,
    required this.packageId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.packageDataEntity,
  });

  @override
  List<Object> get props => [
        id,
        couponId,
        packageId,
        createdAt,
        updatedAt,
        deletedAt,
    packageDataEntity,
      ];
}
