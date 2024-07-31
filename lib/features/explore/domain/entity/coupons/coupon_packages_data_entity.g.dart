// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_packages_data_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CouponPackagesDataEntityCWProxy {
  CouponPackagesDataEntity id(int id);

  CouponPackagesDataEntity couponId(int couponId);

  CouponPackagesDataEntity packageId(int packageId);

  CouponPackagesDataEntity createdAt(DateTime createdAt);

  CouponPackagesDataEntity updatedAt(DateTime updatedAt);

  CouponPackagesDataEntity deletedAt(DateTime deletedAt);

  CouponPackagesDataEntity packageDataEntity(
      PackageDataEntity packageDataEntity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CouponPackagesDataEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CouponPackagesDataEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  CouponPackagesDataEntity call({
    int? id,
    int? couponId,
    int? packageId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    PackageDataEntity? packageDataEntity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCouponPackagesDataEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCouponPackagesDataEntity.copyWith.fieldName(...)`
class _$CouponPackagesDataEntityCWProxyImpl
    implements _$CouponPackagesDataEntityCWProxy {
  const _$CouponPackagesDataEntityCWProxyImpl(this._value);

  final CouponPackagesDataEntity _value;

  @override
  CouponPackagesDataEntity id(int id) => this(id: id);

  @override
  CouponPackagesDataEntity couponId(int couponId) => this(couponId: couponId);

  @override
  CouponPackagesDataEntity packageId(int packageId) =>
      this(packageId: packageId);

  @override
  CouponPackagesDataEntity createdAt(DateTime createdAt) =>
      this(createdAt: createdAt);

  @override
  CouponPackagesDataEntity updatedAt(DateTime updatedAt) =>
      this(updatedAt: updatedAt);

  @override
  CouponPackagesDataEntity deletedAt(DateTime deletedAt) =>
      this(deletedAt: deletedAt);

  @override
  CouponPackagesDataEntity packageDataEntity(
          PackageDataEntity packageDataEntity) =>
      this(packageDataEntity: packageDataEntity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CouponPackagesDataEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CouponPackagesDataEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  CouponPackagesDataEntity call({
    Object? id = const $CopyWithPlaceholder(),
    Object? couponId = const $CopyWithPlaceholder(),
    Object? packageId = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
    Object? packageDataEntity = const $CopyWithPlaceholder(),
  }) {
    return CouponPackagesDataEntity(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      couponId: couponId == const $CopyWithPlaceholder() || couponId == null
          ? _value.couponId
          // ignore: cast_nullable_to_non_nullable
          : couponId as int,
      packageId: packageId == const $CopyWithPlaceholder() || packageId == null
          ? _value.packageId
          // ignore: cast_nullable_to_non_nullable
          : packageId as int,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      deletedAt: deletedAt == const $CopyWithPlaceholder() || deletedAt == null
          ? _value.deletedAt
          // ignore: cast_nullable_to_non_nullable
          : deletedAt as DateTime,
      packageDataEntity: packageDataEntity == const $CopyWithPlaceholder() ||
              packageDataEntity == null
          ? _value.packageDataEntity
          // ignore: cast_nullable_to_non_nullable
          : packageDataEntity as PackageDataEntity,
    );
  }
}

extension $CouponPackagesDataEntityCopyWith on CouponPackagesDataEntity {
  /// Returns a callable class that can be used as follows: `instanceOfCouponPackagesDataEntity.copyWith(...)` or like so:`instanceOfCouponPackagesDataEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CouponPackagesDataEntityCWProxy get copyWith =>
      _$CouponPackagesDataEntityCWProxyImpl(this);
}
