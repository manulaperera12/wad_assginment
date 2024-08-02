import 'package:dartz/dartz.dart';
import 'package:wad_assignment_manula/features/vendor_profile/domain/entity/vendor_profile_entity.dart';
import 'package:wad_assignment_manula/features/vendor_profile/domain/repository/vendor_profile_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';

class VendorProfileUseCase implements UseCase<VendorProfileEntity, int> {
  final VendorProfileRepository vendorProfileRepository;

  VendorProfileUseCase({
    required this.vendorProfileRepository,
  });

  @override
  Future<Either<Failure, VendorProfileEntity>> call(int parentCompanyId) async {
    return await vendorProfileRepository.getVendorProfileDetail(parentCompanyId);
  }
}
