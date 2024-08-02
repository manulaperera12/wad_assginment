import 'package:dartz/dartz.dart';
import 'package:wad_assignment_manula/features/vendor_profile/domain/entity/vendor_profile_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class VendorProfileRepository {
  Future<Either<Failure, VendorProfileEntity>> getVendorProfileDetail(int parentCompanyId);
}