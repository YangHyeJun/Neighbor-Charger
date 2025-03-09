import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'manager/navigator.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigatorManager());
}
