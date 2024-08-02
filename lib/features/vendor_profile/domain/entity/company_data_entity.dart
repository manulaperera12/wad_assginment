import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import '../../../explore/domain/entity/coupons/coupons_entity.dart';
import 'company_entity.dart';

part 'company_data_entity.g.dart';

@CopyWith()
class CompanyDataEntity extends Equatable {
  final int id;
  final String name;
  final dynamic subName;
  final String description;
  final String addressLineOne;
  final int city;
  final int district;
  final int province;
  final int country;
  final int isActive;
  final String siteUrl;
  final String profileImg;
  final String coverImg;
  final double rating;
  final List<CompanyEntity> companyEntity;
  final List<CouponsEntity> couponsEntity;

  const CompanyDataEntity({
    required this.id,
    required this.name,
    required this.subName,
    required this.description,
    required this.addressLineOne,
    required this.city,
    required this.district,
    required this.province,
    required this.country,
    required this.isActive,
    required this.siteUrl,
    required this.profileImg,
    required this.coverImg,
    required this.rating,
    required this.companyEntity,
    required this.couponsEntity,
  });

  @override
  List<Object> get props =>
      [
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
        companyEntity,
        couponsEntity,
      ];
}