import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'manager/navigator.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  try {
    locator.registerLazySingleton(() => NavigatorManager());
  } catch (e, stacktrace) {
    debugPrint("❌ setupLocator 오류 발생: $e\n$stacktrace");
  }
}
