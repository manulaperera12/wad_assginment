import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'company_entity.g.dart';

@CopyWith()
class CompanyEntity extends Equatable {
  final int id;
  final int parentCompanyId;
  final String name;
  final dynamic subName;
  final String description;
  final String addressLineOne;
  final String code;
  final int isActive;
  final int updatedBy;
  final String profileImg;
  final String coverImg;

  const CompanyEntity({
    required this.id,
    required this.parentCompanyId,
    required this.name,
    required this.subName,
    required this.description,
    required this.addressLineOne,
    required this.code,
    required this.isActive,
    required this.updatedBy,
    required this.profileImg,
    required this.coverImg,
  });

  @override
  List<Object> get props => [
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
}
