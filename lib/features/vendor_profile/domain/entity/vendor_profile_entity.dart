import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'company_data_entity.dart';

part 'vendor_profile_entity.g.dart';

@CopyWith()
class VendorProfileEntity extends Equatable {
  final String status;
  final CompanyDataEntity companyDataEntity;

  const VendorProfileEntity({
    required this.status,
    required this.companyDataEntity,
  });

  @override
  List<Object> get props => [status, companyDataEntity];
}