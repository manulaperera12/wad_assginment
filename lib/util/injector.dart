import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wad_assignment_manula/features/vendor_profile/data/datasource/vendor_profile_local_datascource.dart';
import 'package:wad_assignment_manula/features/vendor_profile/data/datasource/vendor_profile_remote_datasource.dart';
import 'package:wad_assignment_manula/features/vendor_profile/data/repository/vendor_profile_repository_impl.dart';
import 'package:wad_assignment_manula/features/vendor_profile/domain/repository/vendor_profile_repository.dart';
import 'package:wad_assignment_manula/features/vendor_profile/domain/usecase/vendor_profile_usecase.dart';
import 'package:wad_assignment_manula/features/vendor_profile/presentation/bloc/vendor_profile_bloc.dart';
import '../core/network/dio_client.dart';
import '../core/network/network_info.dart';
import '../features/explore/data/datasource/coupon/coupon_local_datasource.dart';
import '../features/explore/data/datasource/coupon/coupon_remote_datasource.dart';
import '../features/explore/data/datasource/vendor/vendor_remote_data_source.dart';
import '../features/explore/data/repository/coupon/coupon_repository_impl.dart';
import '../features/explore/data/repository/vendor/vendor_repository_impl.dart';
import '../features/explore/domain/repository/coupons/coupon_repository.dart';
import '../features/explore/domain/repository/vendor/vendor_repository.dart';
import '../features/explore/domain/usecase/coupon/coupon_usecase.dart';
import '../features/explore/domain/usecase/vendor/vendor_usecase.dart';
import '../features/explore/presentation/bloc/coupon/coupon_bloc.dart';
import '../features/explore/presentation/bloc/vendor/vendor_bloc.dart';

final sl = GetIt.instance;

Future<void> setupLocators() async {
  /// Feature: coupon
  // Blocs
  sl.registerFactory<CouponBloc>(() => CouponBloc(couponUseCase: sl()));
  // Use Cases
  sl.registerLazySingleton<GetCouponUseCase>(() => GetCouponUseCase(couponRepository: sl()));
  // Repositories
  sl.registerLazySingleton<CouponRepository>(
      () => CouponRepositoryImpl(networkInfo: sl(), couponLocalDataSource: sl(), couponRemoteDatasource: sl()));
  // Data Sources
  sl.registerLazySingleton<CouponRemoteDatasource>(() => CouponRemoteRemoteDataSourceImpl(dioClient: sl()));
  sl.registerLazySingleton<CouponLocalDataSource>(() => CouponLocalDataSourceImpl(sharedPreferences: sl()));

  /// Feature: vendor profile
  // Blocs
  sl.registerFactory<VendorProfileBloc>(() => VendorProfileBloc(vendorProfileUseCase: sl()));
  // Use Cases
  sl.registerLazySingleton<VendorProfileUseCase>(() => VendorProfileUseCase(vendorProfileRepository: sl()));
  // Repositories
  sl.registerLazySingleton<VendorProfileRepository>(() =>
      VendorProfileRepositoryImpl(networkInfo: sl(), vendorProfileLocalDataSource: sl(), vendorProfileRemoteDataSource: sl()));
  // Data Sources
  sl.registerLazySingleton<VendorProfileRemoteDataSource>(() => VendorProfileRemoteDatasourceImpl(dioClient: sl()));
  sl.registerLazySingleton<VendorProfileLocalDataSource>(() => VendorProfileLocalDataSourceImpl(sharedPreferences: sl()));

  /// Feature: vendor
  // Blocs
  sl.registerFactory<VendorBloc>(() => VendorBloc(vendorUseCase: sl()));
  // Use Cases
  sl.registerLazySingleton<VendorUseCase>(() => VendorUseCase(vendorRepository: sl()));
  // Repositories
  sl.registerLazySingleton<VendorRepository>(() => VendorRepositoryImpl(networkInfo: sl(), vendorRemoteDataSource: sl()));
  // Data Sources
  sl.registerLazySingleton<VendorRemoteDataSource>(() => VendorRemoteDataSourceImpl(dioClient: sl()));

  /// Network
  sl.registerFactory<Dio>(() => Dio());
  sl.registerFactory<DioClient>(() => DioClient(public: sl<Dio>(), auth: sl<Dio>()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  /// Plugins
  /// Shared Preferences
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
}
