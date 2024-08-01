import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../entity/vendor/vendor_entity.dart';

abstract class VendorRepository {
  Future<Either<Failure, VendorEntity>> getVendor();
}
