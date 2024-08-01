import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../util/strings/shared_preferences_keys.dart';
import '../../model/coupon/coupon_model.dart';

abstract class CouponLocalDataSource {
  Future<CouponsModel> getCachedCoupons();

  Future<void> cacheCoupons(CouponsModel couponsModel);
}

class CouponLocalDataSourceImpl implements CouponLocalDataSource {
  final SharedPreferences sharedPreferences;

  const CouponLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> cacheCoupons(CouponsModel couponsModel) async {
    sharedPreferences.setString(CachedModelKeys.couponsCached, couponsModelToJson(couponsModel));
  }

  @override
  Future<CouponsModel> getCachedCoupons() async {
    final jsonString = sharedPreferences.getString(CachedModelKeys.couponsCached);
    if (jsonString != null) {
      return Future.value(couponsModelFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }
}
