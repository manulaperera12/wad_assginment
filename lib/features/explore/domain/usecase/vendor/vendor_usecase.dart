import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entity/vendor/vendor_entity.dart';
import '../../repository/vendor/vendor_repository.dart';

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
