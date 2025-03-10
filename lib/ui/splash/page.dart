import 'package:flutter/cupertino.dart';
import 'package:neighbor_chargers/ui/splash/splash_view.dart';
import 'package:neighbor_chargers/ui/splash/splash_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../cmn/view/nc_page.dart';

class SplashPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<SplashViewModel>(
      create: (_) => SplashViewModel(navigatorManager: navigatorManager),
      child: SplashView(),
    );
  }
}
