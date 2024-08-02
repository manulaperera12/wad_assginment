import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'vendor_profile_coupons_entity.g.dart';

@CopyWith()
class VendorProfileCouponsEntity extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final int parentCompanyId;
  final int value;
  final String valueType;
  final int minSaving;
  final int maxSaving;
  final int isActive;
  final int isSpecialCoupon;
  final int isLimited;
  final int isUser;
  final int isForEveryone;
  final int isAvailableForExpired;
  final int hasFavorited;
  final String? thumbnail;

  const VendorProfileCouponsEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.parentCompanyId,
    required this.value,
    required this.valueType,
    required this.minSaving,
    required this.maxSaving,
    required this.isActive,
    required this.isSpecialCoupon,
    required this.isLimited,
    required this.isUser,
    required this.isForEveryone,
    required this.isAvailableForExpired,
    required this.hasFavorited,
    this.thumbnail,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        description,
        parentCompanyId,
        value,
        valueType,
        minSaving,
        maxSaving,
        isActive,
        isSpecialCoupon,
        isLimited,
        isUser,
        isForEveryone,
        isAvailableForExpired,
        hasFavorited,
        thumbnail,
      ];
}
