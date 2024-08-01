import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../entity/coupons/coupons_entity.dart';

abstract class CouponRepository {
  Future<Either<Failure, CouponsEntity>> getCouponDetail();
}
