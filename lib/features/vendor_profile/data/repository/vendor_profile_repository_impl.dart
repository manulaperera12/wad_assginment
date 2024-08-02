import 'package:dartz/dartz.dart';
import 'package:wad_assignment_manula/features/vendor_profile/data/datasource/vendor_profile_local_datascource.dart';
import 'package:wad_assignment_manula/features/vendor_profile/data/datasource/vendor_profile_remote_datasource.dart';
import 'package:wad_assignment_manula/features/vendor_profile/domain/entity/vendor_profile_entity.dart';
import 'package:wad_assignment_manula/features/vendor_profile/domain/repository/vendor_profile_repository.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';

class VendorProfileRepositoryImpl implements VendorProfileRepository {
  final VendorProfileRemoteDataSource vendorProfileRemoteDataSource;
  final VendorProfileLocalDataSource vendorProfileLocalDataSource;
  final NetworkInfo networkInfo;

  VendorProfileRepositoryImpl({
    required this.vendorProfileRemoteDataSource,
    required this.vendorProfileLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, VendorProfileEntity>> getVendorProfileDetail(int parentCompanyId) async {
    if (await networkInfo.isConnectedToInternet) {
      try {
        final vendorProfileData = await vendorProfileRemoteDataSource.getVendorProfile(parentCompanyId);
        return Right(vendorProfileData.toEntity());
      } on ServerException catch (serverException) {
        return Left(ServerFailure(message: serverException.errorMessage));
      }
    } else {
      try {
        final data = await vendorProfileLocalDataSource.getCachedVendorProfile();
        return Right(data.toEntity());
      } on CacheException {
        return Left(NoConnectionFailure());
      }
    }
  }
}
