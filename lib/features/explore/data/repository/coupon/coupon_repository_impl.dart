import 'package:dartz/dartz.dart';
import 'package:wad_interview_test/features/explore/data/datasource/coupon/coupon_local_datasource.dart';
import 'package:wad_interview_test/features/explore/data/datasource/coupon/coupon_remote_datasource.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../../domain/entity/coupons/coupons_entity.dart';
import '../../../domain/repository/coupons/coupon_repository.dart';

class CouponRepositoryImpl implements CouponRepository {
  final CouponLocalDataSource couponLocalDataSource;
  final CouponRemoteDatasource couponRemoteDatasource;
  final NetworkInfo networkInfo;

  const CouponRepositoryImpl({
    required this.couponLocalDataSource,
    required this.couponRemoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CouponsEntity>> getCouponDetail() async {
    if (await networkInfo.isConnectedToInternet) {
      try {
        final data = await couponRemoteDatasource.getCoupons();
        couponLocalDataSource.cacheCoupons(data);
        return Right(data.toEntity());
      } on ServerException catch (serverException) {
        return Left(ServerFailure(message: serverException.errorMessage));
      }
    } else {
      try {
        final data = await couponLocalDataSource.getCachedCoupons();
        return Right(data.toEntity());
      } on CacheException {
        return Left(NoConnectionFailure());
      }
    }
  }
}
