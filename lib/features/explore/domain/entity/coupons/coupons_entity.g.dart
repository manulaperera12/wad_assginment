// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupons_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CouponsEntityCWProxy {
  CouponsEntity status(String status);

  CouponsEntity couponDataEntity(List<CouponDataEntity> couponDataEntity);

  CouponsEntity subscribedPackage(dynamic subscribedPackage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CouponsEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CouponsEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  CouponsEntity call({
    String? status,
    List<CouponDataEntity>? couponDataEntity,
    dynamic subscribedPackage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCouponsEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCouponsEntity.copyWith.fieldName(...)`
class _$CouponsEntityCWProxyImpl implements _$CouponsEntityCWProxy {
  const _$CouponsEntityCWProxyImpl(this._value);

  final CouponsEntity _value;

  @override
  CouponsEntity status(String status) => this(status: status);

  @override
  CouponsEntity couponDataEntity(List<CouponDataEntity> couponDataEntity) =>
      this(couponDataEntity: couponDataEntity);

  @override
  CouponsEntity subscribedPackage(dynamic subscribedPackage) =>
      this(subscribedPackage: subscribedPackage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CouponsEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CouponsEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  CouponsEntity call({
    Object? status = const $CopyWithPlaceholder(),
    Object? couponDataEntity = const $CopyWithPlaceholder(),
    Object? subscribedPackage = const $CopyWithPlaceholder(),
  }) {
    return CouponsEntity(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
      couponDataEntity: couponDataEntity == const $CopyWithPlaceholder() ||
              couponDataEntity == null
          ? _value.couponDataEntity
          // ignore: cast_nullable_to_non_nullable
          : couponDataEntity as List<CouponDataEntity>,
      subscribedPackage: subscribedPackage == const $CopyWithPlaceholder() ||
              subscribedPackage == null
          ? _value.subscribedPackage
          // ignore: cast_nullable_to_non_nullable
          : subscribedPackage as dynamic,
    );
  }
}

extension $CouponsEntityCopyWith on CouponsEntity {
  /// Returns a callable class that can be used as follows: `instanceOfCouponsEntity.copyWith(...)` or like so:`instanceOfCouponsEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CouponsEntityCWProxy get copyWith => _$CouponsEntityCWProxyImpl(this);
}
