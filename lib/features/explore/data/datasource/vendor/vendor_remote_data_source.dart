import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wad_interview_test/features/explore/data/model/vendor/vendor_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../util/api_endpoints.dart';

abstract class VendorRemoteDataSource {
  Future<VendorModel> getVendor();
}

class VendorRemoteDataSourceImpl implements VendorRemoteDataSource {
  final DioClient dioClient;

  const VendorRemoteDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future<VendorModel> getVendor() async {
    debugPrint("#9595 ApiEndpoints.vendor: ${ApiEndpoints.vendor}");
    try {
      Response response = await dioClient.auth.get(ApiEndpoints.vendor);
      debugPrint("#9595 response.data: ${response.data}");
      return vendorModelFromJson(response.data);
    } on DioException catch (err) {
      debugPrint("#9595 err: $err");
      throw ServerException.fromDioError(err);
    } catch (e) {
      debugPrint("#9595 e: $e");
      throw ServerException(errorMessage: '$e', unexpectedError: true);
    }
  }
}