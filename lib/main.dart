

// void main() async {
//   runZonedGuarded<Future<void>>(
//         () async {
//       WidgetsFlutterBinding.ensureInitialized();
//       Bloc.observer = AssignmentBlocObserver();
//       await setupLocators(); // Initialize service locator
//       runApp(const MyApp());
//     },
//         (error, stack) {
//       debugPrint("runZonedGuarded: Caught error in my root zone. $error");
//       if (!kDebugMode) {
//         debugPrint("#1113 error $error | stack $stack");
//       }
//     },
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // root of application.
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(393, 852),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_ , child) {
//         return const MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: ExploreScreenWrapper(),
//         );
//       },
//       // child: const ExploreScreenWrapper(),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wad_interview_test/util/injector.dart';

import 'core/blocs/bloc_observer.dart';
import 'features/explore/presentation/explore_screen.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      // injector
      await setupLocators();

      /// Setup global observer to monitor all blocs
      Bloc.observer = AssignmentBlocObserver();
      runApp(const MyApp());
    },
        (error, stack) {
      debugPrint("#1113 error $error | stack $stack");
    },
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 930),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const ExploreScreenWrapper(),
    );
  }
}
