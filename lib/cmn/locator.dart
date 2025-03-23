import 'package:get_it/get_it.dart';

import 'manager/navigator.dart';
import 'manager/signIn.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Manager
  locator.registerSingleton<SignInManager>(SignInManager());
  locator.registerSingleton<NavigatorManager>(NavigatorManager());

}
