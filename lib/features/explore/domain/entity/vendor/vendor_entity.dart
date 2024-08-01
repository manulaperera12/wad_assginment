import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:wad_interview_test/features/explore/domain/entity/vendor/parent_company_data_entity.dart';

part 'vendor_entity.g.dart';

@CopyWith()
class VendorEntity extends Equatable {
  final String status;
  final List<ParentCompanyDataEntity> parentCompanyDataEntity;

  const VendorEntity({
    required this.status,
    required this.parentCompanyDataEntity,
  });

  @override
  List<Object> get props => [status, parentCompanyDataEntity];
}
