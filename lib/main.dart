import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wad_assignment_manula/util/injector.dart';
import 'core/blocs/bloc_observer.dart';
import 'features/explore/presentation/explore_screen.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // injector
      await setupLocators();

      /// global observer to monitor all blocs
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
      child: const ExploreScreen(),
    );
  }
}
