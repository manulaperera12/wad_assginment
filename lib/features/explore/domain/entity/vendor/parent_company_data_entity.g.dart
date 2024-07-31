// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_company_data_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ParentCompanyDataEntityCWProxy {
  ParentCompanyDataEntity id(int id);

  ParentCompanyDataEntity parentCompanyId(int parentCompanyId);

  ParentCompanyDataEntity name(String name);

  ParentCompanyDataEntity address(String address);

  ParentCompanyDataEntity rating(int rating);

  ParentCompanyDataEntity description(String description);

  ParentCompanyDataEntity profileImg(String profileImg);

  ParentCompanyDataEntity coverImg(String coverImg);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ParentCompanyDataEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ParentCompanyDataEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ParentCompanyDataEntity call({
    int? id,
    int? parentCompanyId,
    String? name,
    String? address,
    int? rating,
    String? description,
    String? profileImg,
    String? coverImg,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfParentCompanyDataEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfParentCompanyDataEntity.copyWith.fieldName(...)`
class _$ParentCompanyDataEntityCWProxyImpl
    implements _$ParentCompanyDataEntityCWProxy {
  const _$ParentCompanyDataEntityCWProxyImpl(this._value);

  final ParentCompanyDataEntity _value;

  @override
  ParentCompanyDataEntity id(int id) => this(id: id);

  @override
  ParentCompanyDataEntity parentCompanyId(int parentCompanyId) =>
      this(parentCompanyId: parentCompanyId);

  @override
  ParentCompanyDataEntity name(String name) => this(name: name);

  @override
  ParentCompanyDataEntity address(String address) => this(address: address);

  @override
  ParentCompanyDataEntity rating(int rating) => this(rating: rating);

  @override
  ParentCompanyDataEntity description(String description) =>
      this(description: description);

  @override
  ParentCompanyDataEntity profileImg(String profileImg) =>
      this(profileImg: profileImg);

  @override
  ParentCompanyDataEntity coverImg(String coverImg) => this(coverImg: coverImg);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ParentCompanyDataEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ParentCompanyDataEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ParentCompanyDataEntity call({
    Object? id = const $CopyWithPlaceholder(),
    Object? parentCompanyId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? profileImg = const $CopyWithPlaceholder(),
    Object? coverImg = const $CopyWithPlaceholder(),
  }) {
    return ParentCompanyDataEntity(
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
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
      rating: rating == const $CopyWithPlaceholder() || rating == null
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as int,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
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

extension $ParentCompanyDataEntityCopyWith on ParentCompanyDataEntity {
  /// Returns a callable class that can be used as follows: `instanceOfParentCompanyDataEntity.copyWith(...)` or like so:`instanceOfParentCompanyDataEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ParentCompanyDataEntityCWProxy get copyWith =>
      _$ParentCompanyDataEntityCWProxyImpl(this);
}
