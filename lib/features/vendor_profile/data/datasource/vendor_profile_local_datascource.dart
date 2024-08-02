import 'package:shared_preferences/shared_preferences.dart';
import 'package:wad_assignment_manula/features/vendor_profile/data/model/vendor_profile_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../util/strings/shared_preferences_keys.dart';

abstract class VendorProfileLocalDataSource {
  Future<VendorProfileModel> getCachedVendorProfile();

  Future<void> cacheVendorProfile(VendorProfileModel vendorProfileModel);
}

class VendorProfileLocalDataSourceImpl implements VendorProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  VendorProfileLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheVendorProfile(VendorProfileModel vendorProfileModel) async {
    sharedPreferences.setString(CachedModelKeys.vendorProfile, vendorProfileModelToJson(vendorProfileModel));
  }

  @override
  Future<VendorProfileModel> getCachedVendorProfile() async {
    final jsonString = sharedPreferences.getString(CachedModelKeys.vendorProfile);
    if (jsonString != null) {
      return Future.value(vendorProfileModelFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }
}
