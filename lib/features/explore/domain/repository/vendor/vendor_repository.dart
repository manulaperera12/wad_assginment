import 'package:dartz/dartz.dart';
import 'package:wad_interview_test/features/explore/domain/entity/vendor/vendor_entity.dart';

import '../../../../../core/errors/failures.dart';

abstract class VendorRepository {
  Future<Either<Failure, VendorEntity>> getVendor();
}