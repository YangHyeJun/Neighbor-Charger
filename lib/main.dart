import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neighbor_chargers/ui/onBoarding/page.dart';
import 'package:neighbor_chargers/ui/splash/page.dart';

import 'cmn/locator.dart';
import 'cmn/manager/navigator.dart';

final GetIt locator = GetIt.instance;

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: OnBoardingPage(),
    );
  }
}
