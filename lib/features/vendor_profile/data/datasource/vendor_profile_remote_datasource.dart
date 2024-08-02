import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wad_assignment_manula/features/vendor_profile/data/model/vendor_profile_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../util/api_endpoints.dart';

abstract class VendorProfileRemoteDataSource {
  Future<VendorProfileModel> getVendorProfile(int parentCompanyId);
}

class VendorProfileRemoteDatasourceImpl implements VendorProfileRemoteDataSource {
  final DioClient dioClient;

  VendorProfileRemoteDatasourceImpl({required this.dioClient});

  @override
  Future<VendorProfileModel> getVendorProfile(int parentCompanyId) async {
    debugPrint('#23414 ApiEndpoints.vendorProfile: ${ApiEndpoints.vendorProfile}');
    try {
      Response response = await dioClient.auth.get("${ApiEndpoints.vendorProfile}$parentCompanyId");
      debugPrint('#23414 response.data: ${response.data}');
      return vendorProfileModelFromJson(response.data);
    } on DioException catch (err) {
      debugPrint('#23414 err: $err');
      throw ServerException.fromDioError(err);
    } catch (e) {
      debugPrint('#23414 err: $e');
      throw ServerException(errorMessage: '$e', unexpectedError: true);
    }
  }
}
