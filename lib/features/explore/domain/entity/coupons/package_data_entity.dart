import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'package_data_entity.g.dart';

@CopyWith()
class PackageDataEntity extends Equatable {
  final int id;
  final String name;
  final int value;
  final String currencyCode;
  final int validDuration;
  final String description;
  final String moreInfo;
  final String? moreInfoUrl;
  final String termsConditions;
  final int isActive;
  final dynamic zohoItemCode;
  final int updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String packageColor;
  final String zohoItemId;
  final int isHidden;
  final int isOneTimeUsage;
  final int isInstallment;
  final int? installmentAmount;

  const PackageDataEntity({
    required this.id,
    required this.name,
    required this.value,
    required this.currencyCode,
    required this.validDuration,
    required this.description,
    required this.moreInfo,
    required this.moreInfoUrl,
    required this.termsConditions,
    required this.isActive,
    required this.zohoItemCode,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.packageColor,
    required this.zohoItemId,
    required this.isHidden,
    required this.isOneTimeUsage,
    required this.isInstallment,
    required this.installmentAmount,
  });

  @override
  List<Object?> get props =>
      [
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
}