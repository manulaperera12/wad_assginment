import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entity/coupons/coupons_entity.dart';
import '../../repository/coupons/coupon_repository.dart';

class GetCouponUseCase implements UseCase<CouponsEntity, NoParams> {
  final CouponRepository couponRepository;

  GetCouponUseCase({
    required this.couponRepository,
  });

  @override
  Future<Either<Failure, CouponsEntity>> call(NoParams noParams) async {
    return await couponRepository.getCouponDetail();
  }
}