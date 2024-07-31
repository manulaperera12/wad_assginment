import 'package:dartz/dartz.dart';
import 'package:wad_interview_test/features/explore/data/datasource/vendor/vendor_remote_data_source.dart';
import 'package:wad_interview_test/features/explore/domain/entity/vendor/vendor_entity.dart';
import 'package:wad_interview_test/features/explore/domain/repository/vendor/vendor_repository.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/network_info.dart';

class VendorRepositoryImpl implements VendorRepository {
  final VendorRemoteDataSource vendorRemoteDataSource;
  final NetworkInfo networkInfo;

  const VendorRepositoryImpl({
    required this.vendorRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, VendorEntity>> getVendor() async {
    try {
      final data = await vendorRemoteDataSource.getVendor();
      return Right(data.toEntity());
    } on ServerException catch (serverException) {
      // if (serverException.unexpectedError) {
      //   FirebaseServices.sendCrashReport(serverException, StackTrace.current);
      // }
      return Left(ServerFailure(message: serverException.errorMessage));
    }
  }
}