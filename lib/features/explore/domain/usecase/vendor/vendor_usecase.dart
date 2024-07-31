import 'package:dartz/dartz.dart';
import 'package:wad_interview_test/features/explore/domain/entity/vendor/vendor_entity.dart';
import 'package:wad_interview_test/features/explore/domain/repository/vendor/vendor_repository.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/usecase/usecase.dart';

class VendorUseCase implements UseCase<VendorEntity, NoParams> {
  final VendorRepository vendorRepository;

  const VendorUseCase({
    required this.vendorRepository,
  });

  @override
  Future<Either<Failure, VendorEntity>> call(NoParams param) async {
    return await vendorRepository.getVendor();
  }
}