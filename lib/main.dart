import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:neighbor_chargers/ui/splash/page.dart';

import 'cmn/locator.dart';
import 'cmn/manager/navigator.dart';

final GetIt locator = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 추가
  setupLocator();

  FlutterNativeSplash.remove(); // 여기에 바로 호출

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigatorManager>().navigatorKey,
      home: const SplashPage(),
    );
  }
}
