// To parse this JSON data, do
//
//     final couponsModel = couponsModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../../domain/entity/coupons/coupon_data_entity.dart';
import '../../../domain/entity/coupons/coupon_packages_data_entity.dart';
import '../../../domain/entity/coupons/coupons_entity.dart';
import '../../../domain/entity/coupons/package_data_entity.dart';

CouponsModel couponsModelFromJson(String str) => CouponsModel.fromJson(json.decode(str));

String couponsModelToJson(CouponsModel data) => json.encode(data.toJson());

class CouponsModel extends Equatable {
  final String? status;
  final List<Coupon>? coupons;
  final dynamic subscribedPackage;

  const CouponsModel({
    this.status,
    this.coupons,
    this.subscribedPackage,
  });

  @override
  List<Object?> get props => [status, coupons, subscribedPackage];

  factory CouponsModel.fromJson(Map<String, dynamic> json) => CouponsModel(
        status: json["status"],
        coupons: json["coupons"] == null ? [] : List<Coupon>.from(json["coupons"]!.map((x) => Coupon.fromJson(x))),
        subscribedPackage: json["subscribedPackage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "coupons": coupons == null ? [] : List<dynamic>.from(coupons!.map((x) => x.toJson())),
        "subscribedPackage": subscribedPackage,
      };

  CouponsEntity toEntity() {
    return CouponsEntity(
        status: status ?? '',
        subscribedPackage: subscribedPackage,
        couponDataEntity: List.from((coupons ?? []).map((data) {
          return CouponDataEntity(
              id: data.id ?? -9999,
              title: data.title ?? '',
              description: data.description ?? '',
              value: data.value ?? 0,
              valueType: data.valueType ?? '',
              minSaving: data.minSaving ?? 0,
              maxSaving: data.maxSaving ?? 0,
              validFrom: data.validFrom ?? DateTime(2024),
              validTo: data.validTo ?? DateTime(2024),
              isLimited: data.isLimited ?? 0,
              isAvailableForExpired: data.isAvailableForExpired ?? 0,
              hasFavorited: data.hasFavorited ?? 0,
              parentCompanyId: data.parentCompanyId ?? 0,
              parentCompanyName: data.parentCompanyName ?? '',
              parentCompanyProfileImg: data.parentCompanyProfileImg ?? '',
              parentCompanyCoverImg: data.parentCompanyCoverImg ?? '',
              couponPackagesDataEntity: List.from(
                (data.couponPackagesData ?? []).map((data) {
                  return CouponPackagesDataEntity(
                    id: data.id ?? -9999,
                    couponId: data.couponId ?? -9999,
                    packageId: data.packageId ?? -9999,
                    createdAt: data.createdAt ?? DateTime(2024),
                    updatedAt: data.updatedAt ?? DateTime(2024),
                    deletedAt: data.deletedAt ?? DateTime(2024),
                    packageDataEntity: PackageDataEntity(
                      id: data.packageData?.id ?? -9999,
                      name: data.packageData?.name ?? '',
                      value: data.packageData?.value ?? 0,
                      currencyCode: data.packageData?.currencyCode ?? '',
                      validDuration: data.packageData?.validDuration ?? 0,
                      description: data.packageData?.description ?? '',
                      moreInfo: data.packageData?.moreInfo ?? '',
                      moreInfoUrl: data.packageData?.moreInfoUrl ?? '',
                      termsConditions: data.packageData?.termsConditions ?? '',
                      isActive: data.packageData?.isActive ?? 0,
                      zohoItemCode: data.packageData?.zohoItemCode,
                      updatedBy: data.packageData?.updatedBy ?? 0,
                      createdAt: data.packageData?.createdAt ?? DateTime(2024),
                      updatedAt: data.packageData?.updatedAt ?? DateTime(2024),
                      packageColor: data.packageData?.packageColor ?? '',
                      zohoItemId: data.packageData?.zohoItemId ?? '',
                      isHidden: data.packageData?.isHidden ?? 0,
                      isOneTimeUsage: data.packageData?.isOneTimeUsage ?? 0,
                      isInstallment: data.packageData?.isInstallment ?? 0,
                      installmentAmount: data.packageData?.installmentAmount ?? 0,
                    ),
                  );
                }),
              ));
        })));
  }
}

class Coupon extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final int? value;
  final String? valueType;
  final int? minSaving;
  final int? maxSaving;
  final DateTime? validFrom;
  final DateTime? validTo;
  final int? isLimited;
  final int? isAvailableForExpired;
  final int? hasFavorited;
  final int? parentCompanyId;
  final String? parentCompanyName;
  final String? parentCompanyProfileImg;
  final String? parentCompanyCoverImg;
  final List<CouponPackagesDatum>? couponPackagesData;

  const Coupon({
    this.id,
    this.title,
    this.description,
    this.value,
    this.valueType,
    this.minSaving,
    this.maxSaving,
    this.validFrom,
    this.validTo,
    this.isLimited,
    this.isAvailableForExpired,
    this.hasFavorited,
    this.parentCompanyId,
    this.parentCompanyName,
    this.parentCompanyProfileImg,
    this.parentCompanyCoverImg,
    this.couponPackagesData,
  });

  @override
  List<Object?> get props => [
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
        couponPackagesData,
      ];

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        value: json["value"],
        valueType: json["value_type"],
        minSaving: json["min_saving"],
        maxSaving: json["max_saving"],
        validFrom: json["valid_from"] == null ? null : DateTime.parse(json["valid_from"]),
        validTo: json["valid_to"] == null ? null : DateTime.parse(json["valid_to"]),
        isLimited: json["is_limited"],
        isAvailableForExpired: json["is_available_for_expired"],
        hasFavorited: json["hasFavorited"],
        parentCompanyId: json["parent_company_id"],
        parentCompanyName: json["parent_company_name"],
        parentCompanyProfileImg: json["parent_company_profile_img"],
        parentCompanyCoverImg: json["parent_company_cover_img"],
        couponPackagesData: json["coupon_packages_data"] == null
            ? []
            : List<CouponPackagesDatum>.from(json["coupon_packages_data"]!.map((x) => CouponPackagesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "value": value,
        "value_type": valueType,
        "min_saving": minSaving,
        "max_saving": maxSaving,
        "valid_from": validFrom?.toIso8601String(),
        "valid_to": validTo?.toIso8601String(),
        "is_limited": isLimited,
        "is_available_for_expired": isAvailableForExpired,
        "hasFavorited": hasFavorited,
        "parent_company_id": parentCompanyId,
        "parent_company_name": parentCompanyName,
        "parent_company_profile_img": parentCompanyProfileImg,
        "parent_company_cover_img": parentCompanyCoverImg,
        "coupon_packages_data": couponPackagesData == null ? [] : List<dynamic>.from(couponPackagesData!.map((x) => x.toJson())),
      };
}

class CouponPackagesDatum extends Equatable {
  final int? id;
  final int? couponId;
  final int? packageId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final PackageData? packageData;

  const CouponPackagesDatum({
    this.id,
    this.couponId,
    this.packageId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.packageData,
  });

  @override
  List<Object?> get props => [
        id,
        couponId,
        packageId,
        createdAt,
        updatedAt,
        deletedAt,
        packageData,
      ];

  factory CouponPackagesDatum.fromJson(Map<String, dynamic> json) => CouponPackagesDatum(
        id: json["id"],
        couponId: json["coupon_id"],
        packageId: json["package_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["updated_at"]),
        packageData: json["package_data"] == null ? null : PackageData.fromJson(json["package_data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coupon_id": couponId,
        "package_id": packageId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt?.toIso8601String(),
        "package_data": packageData?.toJson(),
      };
}

class PackageData extends Equatable {
  final int? id;
  final String? name;
  final int? value;
  final String? currencyCode;
  final int? validDuration;
  final String? description;
  final String? moreInfo;
  final String? moreInfoUrl;
  final String? termsConditions;
  final int? isActive;
  final dynamic zohoItemCode;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? packageColor;
  final String? zohoItemId;
  final int? isHidden;
  final int? isOneTimeUsage;
  final int? isInstallment;
  final int? installmentAmount;

  const PackageData({
    this.id,
    this.name,
    this.value,
    this.currencyCode,
    this.validDuration,
    this.description,
    this.moreInfo,
    this.moreInfoUrl,
    this.termsConditions,
    this.isActive,
    this.zohoItemCode,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.packageColor,
    this.zohoItemId,
    this.isHidden,
    this.isOneTimeUsage,
    this.isInstallment,
    this.installmentAmount,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        value,
        currencyCode,
        validDuration,
        description,
        moreInfo,
        moreInfoUrl,
        termsConditions,
        isActive,
        zohoItemCode,
        updatedBy,
        createdAt,
        updatedAt,
        packageColor,
        zohoItemId,
        isHidden,
        isOneTimeUsage,
        isInstallment,
        installmentAmount,
      ];

  factory PackageData.fromJson(Map<String, dynamic> json) => PackageData(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        currencyCode: json["currency_code"],
        validDuration: json["valid_duration"],
        description: json["description"],
        moreInfo: json["more_info"],
        moreInfoUrl: json["more_info_url"],
        termsConditions: json["terms_conditions"],
        isActive: json["is_active"],
        zohoItemCode: json["zoho_item_code"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        packageColor: json["package_color"],
        zohoItemId: json["zoho_item_id"],
        isHidden: json["is_hidden"],
        isOneTimeUsage: json["is_one_time_usage"],
        isInstallment: json["is_installment"],
        installmentAmount: json["installment_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "currency_code": currencyCode,
        "valid_duration": validDuration,
        "description": description,
        "more_info": moreInfo,
        "more_info_url": moreInfoUrl,
        "terms_conditions": termsConditions,
        "is_active": isActive,
        "zoho_item_code": zohoItemCode,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "package_color": packageColor,
        "zoho_item_id": zohoItemId,
        "is_hidden": isHidden,
        "is_one_time_usage": isOneTimeUsage,
        "is_installment": isInstallment,
        "installment_amount": installmentAmount,
      };
}
