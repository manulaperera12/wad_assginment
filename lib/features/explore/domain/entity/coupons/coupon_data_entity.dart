import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'coupon_packages_data_entity.dart';

part 'coupon_data_entity.g.dart';

@CopyWith()
class CouponDataEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final int value;
  final String valueType;
  final int minSaving;
  final int maxSaving;
  final DateTime validFrom;
  final DateTime validTo;
  final int isLimited;
  final int isAvailableForExpired;
  final int hasFavorited;
  final int parentCompanyId;
  final String parentCompanyName;
  final String parentCompanyProfileImg;
  final String parentCompanyCoverImg;
  final List<CouponPackagesDataEntity> couponPackagesDataEntity;

  const CouponDataEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.value,
    required this.valueType,
    required this.minSaving,
    required this.maxSaving,
    required this.validFrom,
    required this.validTo,
    required this.isLimited,
    required this.isAvailableForExpired,
    required this.hasFavorited,
    required this.parentCompanyId,
    required this.parentCompanyName,
    required this.parentCompanyProfileImg,
    required this.parentCompanyCoverImg,
    required this.couponPackagesDataEntity,
  });

  @override
  List<Object> get props =>
      [
        id,
        title,
        description,
        value,
        valueType,
        minSaving,
        maxSaving,
        validFrom,
        validTo,
        isLimited,
        isAvailableForExpired,
        hasFavorited,
        parentCompanyId,
        parentCompanyName,
        parentCompanyProfileImg,
        parentCompanyCoverImg,
        couponPackagesDataEntity,
      ];
}