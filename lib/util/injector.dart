import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wad_interview_test/features/explore/data/datasource/coupon/coupon_remote_datasource.dart';
import 'package:wad_interview_test/features/explore/domain/repository/coupons/coupon_repository.dart';
import 'package:wad_interview_test/features/explore/domain/usecase/coupon/coupon_usecase.dart';
import 'package:wad_interview_test/features/explore/presentation/bloc/coupon/coupon_bloc.dart';

import '../core/network/dio_client.dart';
import '../core/network/network_info.dart';
import '../features/explore/data/datasource/coupon/coupon_local_datasource.dart';
import '../features/explore/data/repository/coupon/coupon_repository_Impl.dart';

final sl = GetIt.instance;

Future<void> setupLocators() async {

  /// Feature: coupon
  // Blocs
  sl.registerFactory<CouponBloc>(() => CouponBloc(couponUseCase: sl()));
  // Use Cases
  sl.registerLazySingleton<GetCouponUseCase>(() => GetCouponUseCase(couponRepository: sl()));
  // Repositories
  sl.registerLazySingleton<CouponRepository>(() => CouponRepositoryImpl(networkInfo: sl(), couponLocalDataSource: sl(), couponRemoteDatasource: sl()));
  // Data Sources
  sl.registerLazySingleton<CouponRemoteDatasource>(() => CouponRemoteRemoteDataSourceImpl(dioClient: sl()));
  sl.registerLazySingleton<CouponLocalDataSource>(() => CouponLocalDataSourceImpl(sharedPreferences: sl()));


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
