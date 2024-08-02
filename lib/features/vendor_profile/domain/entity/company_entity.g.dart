// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CompanyEntityCWProxy {
  CompanyEntity id(int id);

  CompanyEntity parentCompanyId(int parentCompanyId);

  CompanyEntity name(String name);

  CompanyEntity subName(dynamic subName);

  CompanyEntity description(String description);

  CompanyEntity addressLineOne(String addressLineOne);

  CompanyEntity code(String code);

  CompanyEntity isActive(int isActive);

  CompanyEntity updatedBy(int updatedBy);

  CompanyEntity profileImg(String profileImg);

  CompanyEntity coverImg(String coverImg);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyEntity call({
    int? id,
    int? parentCompanyId,
    String? name,
    dynamic subName,
    String? description,
    String? addressLineOne,
    String? code,
    int? isActive,
    int? updatedBy,
    String? profileImg,
    String? coverImg,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCompanyEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCompanyEntity.copyWith.fieldName(...)`
class _$CompanyEntityCWProxyImpl implements _$CompanyEntityCWProxy {
  const _$CompanyEntityCWProxyImpl(this._value);

  final CompanyEntity _value;

  @override
  CompanyEntity id(int id) => this(id: id);

  @override
  CompanyEntity parentCompanyId(int parentCompanyId) =>
      this(parentCompanyId: parentCompanyId);

  @override
  CompanyEntity name(String name) => this(name: name);

  @override
  CompanyEntity subName(dynamic subName) => this(subName: subName);

  @override
  CompanyEntity description(String description) =>
      this(description: description);

  @override
  CompanyEntity addressLineOne(String addressLineOne) =>
      this(addressLineOne: addressLineOne);

  @override
  CompanyEntity code(String code) => this(code: code);

  @override
  CompanyEntity isActive(int isActive) => this(isActive: isActive);

  @override
  CompanyEntity updatedBy(int updatedBy) => this(updatedBy: updatedBy);

  @override
  CompanyEntity profileImg(String profileImg) => this(profileImg: profileImg);

  @override
  CompanyEntity coverImg(String coverImg) => this(coverImg: coverImg);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyEntity call({
    Object? id = const $CopyWithPlaceholder(),
    Object? parentCompanyId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? subName = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? addressLineOne = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? isActive = const $CopyWithPlaceholder(),
    Object? updatedBy = const $CopyWithPlaceholder(),
    Object? profileImg = const $CopyWithPlaceholder(),
    Object? coverImg = const $CopyWithPlaceholder(),
  }) {
    return CompanyEntity(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      parentCompanyId: parentCompanyId == const $CopyWithPlaceholder() ||
              parentCompanyId == null
          ? _value.parentCompanyId
          // ignore: cast_nullable_to_non_nullable
          : parentCompanyId as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      subName: subName == const $CopyWithPlaceholder() || subName == null
          ? _value.subName
          // ignore: cast_nullable_to_non_nullable
          : subName as dynamic,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      addressLineOne: addressLineOne == const $CopyWithPlaceholder() ||
              addressLineOne == null
          ? _value.addressLineOne
          // ignore: cast_nullable_to_non_nullable
          : addressLineOne as String,
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      isActive: isActive == const $CopyWithPlaceholder() || isActive == null
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as int,
      updatedBy: updatedBy == const $CopyWithPlaceholder() || updatedBy == null
          ? _value.updatedBy
          // ignore: cast_nullable_to_non_nullable
          : updatedBy as int,
      profileImg:
          profileImg == const $CopyWithPlaceholder() || profileImg == null
              ? _value.profileImg
              // ignore: cast_nullable_to_non_nullable
              : profileImg as String,
      coverImg: coverImg == const $CopyWithPlaceholder() || coverImg == null
          ? _value.coverImg
          // ignore: cast_nullable_to_non_nullable
          : coverImg as String,
    );
  }
}

extension $CompanyEntityCopyWith on CompanyEntity {
  /// Returns a callable class that can be used as follows: `instanceOfCompanyEntity.copyWith(...)` or like so:`instanceOfCompanyEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CompanyEntityCWProxy get copyWith => _$CompanyEntityCWProxyImpl(this);
}
