import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'parent_company_data_entity.g.dart';

@CopyWith()
class ParentCompanyDataEntity extends Equatable {
  final int id;
  final int parentCompanyId;
  final String name;
  final String address;
  final double rating;
  final String description;
  final String profileImg;
  final String coverImg;

  const ParentCompanyDataEntity({
    required this.id,
    required this.parentCompanyId,
    required this.name,
    required this.address,
    required this.rating,
    required this.description,
    required this.profileImg,
    required this.coverImg,
  });

  @override
  List<Object> get props => [
        id,
        parentCompanyId,
        name,
        address,
        rating,
        description,
        profileImg,
        coverImg,
      ];
}
