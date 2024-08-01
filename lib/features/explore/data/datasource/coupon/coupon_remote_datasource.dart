import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wad_interview_test/features/explore/data/model/coupon/coupon_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../util/api_endpoints.dart';

abstract class CouponRemoteDatasource {
  Future<CouponsModel> getCoupons();
}

class CouponRemoteRemoteDataSourceImpl implements CouponRemoteDatasource {
  final DioClient dioClient;

  const CouponRemoteRemoteDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future<CouponsModel> getCoupons() async {
    debugPrint('#32423 ApiEndpoints.coupon: ${ApiEndpoints.coupon}');
    try {
      Response response = await dioClient.public.get(ApiEndpoints.coupon);
      debugPrint('#32423 response.data: ${response.data}');
      return couponsModelFromJson(response.data);
    } on DioException catch (err) {
      debugPrint('#32423 err: $err');
      throw ServerException.fromDioError(err);
    } catch (e) {
      debugPrint('#32423 e: $e');
      throw ServerException(errorMessage: '$e', unexpectedError: true);
    }
  }
}
