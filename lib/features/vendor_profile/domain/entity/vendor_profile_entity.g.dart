// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_profile_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VendorProfileEntityCWProxy {
  VendorProfileEntity status(String status);

  VendorProfileEntity companyDataEntity(CompanyDataEntity companyDataEntity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VendorProfileEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VendorProfileEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  VendorProfileEntity call({
    String? status,
    CompanyDataEntity? companyDataEntity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVendorProfileEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVendorProfileEntity.copyWith.fieldName(...)`
class _$VendorProfileEntityCWProxyImpl implements _$VendorProfileEntityCWProxy {
  const _$VendorProfileEntityCWProxyImpl(this._value);

  final VendorProfileEntity _value;

  @override
  VendorProfileEntity status(String status) => this(status: status);

  @override
  VendorProfileEntity companyDataEntity(CompanyDataEntity companyDataEntity) =>
      this(companyDataEntity: companyDataEntity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VendorProfileEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VendorProfileEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  VendorProfileEntity call({
    Object? status = const $CopyWithPlaceholder(),
    Object? companyDataEntity = const $CopyWithPlaceholder(),
  }) {
    return VendorProfileEntity(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
      companyDataEntity: companyDataEntity == const $CopyWithPlaceholder() ||
              companyDataEntity == null
          ? _value.companyDataEntity
          // ignore: cast_nullable_to_non_nullable
          : companyDataEntity as CompanyDataEntity,
    );
  }
}

extension $VendorProfileEntityCopyWith on VendorProfileEntity {
  /// Returns a callable class that can be used as follows: `instanceOfVendorProfileEntity.copyWith(...)` or like so:`instanceOfVendorProfileEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VendorProfileEntityCWProxy get copyWith =>
      _$VendorProfileEntityCWProxyImpl(this);
}
