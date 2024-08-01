// To parse this JSON data, do
//
//     final vendorModel = vendorModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../../domain/entity/vendor/parent_company_data_entity.dart';
import '../../../domain/entity/vendor/vendor_entity.dart';

VendorModel vendorModelFromJson(String str) => VendorModel.fromJson(json.decode(str));

String vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel extends Equatable {
  final String? status;
  final List<ParentCompanyDatum>? parentCompanyData;

  const VendorModel({
    this.status,
    this.parentCompanyData,
  });

  @override
  List<Object?> get props => [status, parentCompanyData];

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        status: json["status"],
        parentCompanyData: json["parentCompanyData"] == null
            ? []
            : List<ParentCompanyDatum>.from(json["parentCompanyData"]!.map((x) => ParentCompanyDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "parentCompanyData": parentCompanyData == null ? [] : List<dynamic>.from(parentCompanyData!.map((x) => x.toJson())),
      };

  VendorEntity toEntity() {
    return VendorEntity(
      status: status ?? '',
      parentCompanyDataEntity: List.from((parentCompanyData ?? []).map(
        (parentCompanyData) => ParentCompanyDataEntity(
          id: parentCompanyData.id ?? -9999,
          parentCompanyId: parentCompanyData.parentCompanyId ?? -9999,
          name: parentCompanyData.name ?? '',
          address: parentCompanyData.address ?? '',
          rating: parentCompanyData.rating ?? 0,
          description: parentCompanyData.description ?? '',
          profileImg: parentCompanyData.profileImg ?? '',
          coverImg: parentCompanyData.coverImg ?? '',
        ),
      )),
    );
  }
}

class ParentCompanyDatum extends Equatable {
  final int? id;
  final int? parentCompanyId;
  final String? name;
  final String? address;
  final double? rating;
  final String? description;
  final String? profileImg;
  final String? coverImg;

  const ParentCompanyDatum({
    this.id,
    this.parentCompanyId,
    this.name,
    this.address,
    this.rating,
    this.description,
    this.profileImg,
    this.coverImg,
  });

  @override
  List<Object?> get props => [
        id,
        parentCompanyId,
        name,
        address,
        rating,
        description,
        profileImg,
        coverImg,
      ];

  factory ParentCompanyDatum.fromJson(Map<String, dynamic> json) => ParentCompanyDatum(
        id: json["id"],
        parentCompanyId: json["parent_company_id"],
        name: json["name"],
        address: json["address"],
        rating: (json["rating"] as num).toDouble(),
        description: json["description"],
        profileImg: json["profile_img"],
        coverImg: json["cover_img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_company_id": parentCompanyId,
        "name": name,
        "address": address,
        "rating": rating,
        "description": description,
        "profile_img": profileImg,
        "cover_img": coverImg,
      };
}
