// To parse this JSON data, do
//
//     final vendorProfileModel = vendorProfileModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:wad_assignment_manula/features/vendor_profile/domain/entity/company_data_entity.dart';
import 'package:wad_assignment_manula/features/vendor_profile/domain/entity/vendor_profile_coupons_entity.dart';
import 'package:wad_assignment_manula/features/vendor_profile/domain/entity/vendor_profile_entity.dart';

import '../../domain/entity/company_entity.dart';

VendorProfileModel vendorProfileModelFromJson(String str) => VendorProfileModel.fromJson(json.decode(str));

String vendorProfileModelToJson(VendorProfileModel data) => json.encode(data.toJson());

class VendorProfileModel extends Equatable {
  final String? status;
  final CompanyData? companyData;

  const VendorProfileModel({
    this.status,
    this.companyData,
  });

  @override
  List<Object?> get props => [status, companyData];

  factory VendorProfileModel.fromJson(Map<String, dynamic> json) => VendorProfileModel(
        status: json["status"],
        companyData: json["companyData"] == null ? null : CompanyData.fromJson(json["companyData"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "companyData": companyData?.toJson(),
      };

  VendorProfileEntity toEntity() {
    return VendorProfileEntity(
      status: status ?? '',
      companyDataEntity: CompanyDataEntity(
        id: companyData?.id ?? -9999,
        name: companyData?.name ?? '',
        subName: companyData?.subName ?? '',
        description: companyData?.description ?? '',
        addressLineOne: companyData?.addressLineOne ?? '',
        city: companyData?.city ?? 0,
        district: companyData?.district ?? 0,
        province: companyData?.province ?? 0,
        country: companyData?.country ?? 0,
        isActive: companyData?.isActive ?? 0,
        siteUrl: companyData?.siteUrl ?? '',
        profileImg: companyData?.profileImg ?? '',
        coverImg: companyData?.coverImg ?? '',
        rating: companyData?.rating ?? 0.0,
        companyEntity: List.from(
          (companyData?.company ?? []).map((companyEntity) {
            return CompanyEntity(
              id: companyEntity.id ?? -9999,
              parentCompanyId: companyEntity.parentCompanyId ?? -9999,
              name: companyEntity.name ?? '',
              subName: companyEntity.subName ?? '',
              description: companyEntity.description ?? '',
              addressLineOne: companyEntity.addressLineOne ?? '',
              code: companyEntity.code ?? '',
              isActive: companyEntity.isActive ?? 0,
              updatedBy: companyEntity.updatedBy ?? 0,
              profileImg: companyEntity.profileImg ?? '',
              coverImg: companyEntity.coverImg ?? '',
            );
          }),
        ),
        couponsEntity: List.from(
          (companyData?.coupons ?? []).map((couponsEntity) {
            return VendorProfileCouponsEntity(
              id: couponsEntity.id ?? -9999,
              parentCompanyId: couponsEntity.parentCompanyId ?? -9999,
              title: couponsEntity.title ?? '',
              subtitle: couponsEntity.subtitle ?? '',
              description: couponsEntity.description ?? '',
              value: couponsEntity.value ?? 0,
              valueType: couponsEntity.valueType ?? '',
              minSaving: couponsEntity.minSaving ?? 0,
              maxSaving: couponsEntity.maxSaving ?? 0,
              isActive: couponsEntity.isActive ?? 0,
              isSpecialCoupon: couponsEntity.isSpecialCoupon ?? 0,
              isLimited: couponsEntity.isLimited ?? 0,
              isUser: couponsEntity.isUser ?? 0,
              isForEveryone: couponsEntity.isForEveryone ?? 0,
              isAvailableForExpired: couponsEntity.isAvailableForExpired ?? 0,
              hasFavorited: couponsEntity.hasFavorited ?? 0,
              thumbnail: couponsEntity.thumbnail ?? '',
            );
          }),
        ),
      ),
    );
  }
}

class CompanyData extends Equatable {
  final int? id;
  final String? name;
  final dynamic subName;
  final String? description;
  final String? addressLineOne;
  final int? city;
  final int? district;
  final int? province;
  final int? country;
  final int? isActive;
  final String? siteUrl;
  final String? profileImg;
  final String? coverImg;
  final double? rating;
  final List<Company>? company;
  final List<Coupon>? coupons;

  const CompanyData({
    this.id,
    this.name,
    this.subName,
    this.description,
    this.addressLineOne,
    this.city,
    this.district,
    this.province,
    this.country,
    this.isActive,
    this.siteUrl,
    this.profileImg,
    this.coverImg,
    this.rating,
    this.company,
    this.coupons,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        subName,
        description,
        addressLineOne,
        city,
        district,
        province,
        country,
        isActive,
        siteUrl,
        profileImg,
        coverImg,
        rating,
        company,
        coupons,
      ];

  factory CompanyData.fromJson(Map<String, dynamic> json) => CompanyData(
        id: json["id"],
        name: json["name"],
        subName: json["sub_name"],
        description: json["description"],
        addressLineOne: json["address_line_one"],
        city: json["city"],
        district: json["district"],
        province: json["province"],
        country: json["country"],
        isActive: json["is_active"],
        siteUrl: json["site_url"],
        profileImg: json["profile_img"],
        coverImg: json["cover_img"],
        rating: json["rating"]?.toDouble(),
        company: json["company"] == null ? [] : List<Company>.from(json["company"]!.map((x) => Company.fromJson(x))),
        coupons: json["coupons"] == null ? [] : List<Coupon>.from(json["coupons"]!.map((x) => Coupon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub_name": subName,
        "description": description,
        "address_line_one": addressLineOne,
        "city": city,
        "district": district,
        "province": province,
        "country": country,
        "is_active": isActive,
        "site_url": siteUrl,
        "profile_img": profileImg,
        "cover_img": coverImg,
        "rating": rating,
        "company": company == null ? [] : List<dynamic>.from(company!.map((x) => x.toJson())),
        "coupons": coupons == null ? [] : List<dynamic>.from(coupons!.map((x) => x.toJson())),
      };
}

class Company extends Equatable {
  final int? id;
  final int? parentCompanyId;
  final String? name;
  final dynamic subName;
  final String? description;
  final String? addressLineOne;
  final String? code;
  final int? isActive;
  final int? updatedBy;
  final String? profileImg;
  final String? coverImg;

  const Company({
    this.id,
    this.parentCompanyId,
    this.name,
    this.subName,
    this.description,
    this.addressLineOne,
    this.code,
    this.isActive,
    this.updatedBy,
    this.profileImg,
    this.coverImg,
  });

  @override
  List<Object?> get props => [
        id,
        parentCompanyId,
        name,
        subName,
        description,
        addressLineOne,
        code,
        isActive,
        updatedBy,
        profileImg,
        coverImg,
      ];

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        parentCompanyId: json["parent_company_id"],
        name: json["name"],
        subName: json["sub_name"],
        description: json["description"],
        addressLineOne: json["address_line_one"],
        code: json["code"],
        isActive: json["is_active"],
        updatedBy: json["updated_by"],
        profileImg: json["profile_img"],
        coverImg: json["cover_img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_company_id": parentCompanyId,
        "name": name,
        "sub_name": subName,
        "description": description,
        "address_line_one": addressLineOne,
        "code": code,
        "is_active": isActive,
        "updated_by": updatedBy,
        "profile_img": profileImg,
        "cover_img": coverImg,
      };
}

class Coupon extends Equatable {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final int? parentCompanyId;
  final int? value;
  final String? valueType;
  final int? minSaving;
  final int? maxSaving;
  final int? isActive;
  final int? isSpecialCoupon;
  final int? isLimited;
  final int? isUser;
  final int? isForEveryone;
  final int? isAvailableForExpired;
  final int? hasFavorited;
  final String? thumbnail;

  const Coupon({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.parentCompanyId,
    this.value,
    this.valueType,
    this.minSaving,
    this.maxSaving,
    this.isActive,
    this.isSpecialCoupon,
    this.isLimited,
    this.isUser,
    this.isForEveryone,
    this.isAvailableForExpired,
    this.hasFavorited,
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

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        parentCompanyId: json["parent_company_id"],
        value: json["value"],
        valueType: json["value_type"],
        minSaving: json["min_saving"],
        maxSaving: json["max_saving"],
        isActive: json["is_active"],
        isSpecialCoupon: json["is_special_coupon"],
        isLimited: json["is_limited"],
        isUser: json["is_user"],
        isForEveryone: json["is_for_everyone"],
        isAvailableForExpired: json["is_available_for_expired"],
        hasFavorited: json["hasFavorited"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "parent_company_id": parentCompanyId,
        "value": value,
        "value_type": valueType,
        "min_saving": minSaving,
        "max_saving": maxSaving,
        "is_active": isActive,
        "is_special_coupon": isSpecialCoupon,
        "is_limited": isLimited,
        "is_user": isUser,
        "is_for_everyone": isForEveryone,
        "is_available_for_expired": isAvailableForExpired,
        "hasFavorited": hasFavorited,
        "thumbnail": thumbnail,
      };
}
