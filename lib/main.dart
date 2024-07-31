import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wad_interview_test/util/injector.dart';

import 'core/blocs/bloc_observer.dart';
import 'features/explore/presentation/explore_screen.dart';

void main() async {
  runZonedGuarded<Future<void>>(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      Bloc.observer = AssignmentBlocObserver();
      await setupLocators(); // Initialize service locator
      runApp(const MyApp());
    },
        (error, stack) {
      debugPrint("runZonedGuarded: Caught error in my root zone. $error");
      if (!kDebugMode) {
        debugPrint("#1113 error $error | stack $stack");
      }
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // root of application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ExploreScreenWrapper(),
        );
      },
      // child: const ExploreScreenWrapper(),
    );
  }
}
