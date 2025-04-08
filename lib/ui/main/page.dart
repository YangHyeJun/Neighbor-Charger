import 'package:flutter/cupertino.dart';
import 'package:neighbor_chargers/ui/main/view.dart';
import 'package:neighbor_chargers/ui/main/viewmodel.dart';
import 'package:provider/provider.dart';

import '../../cmn/locator.dart';
import '../../cmn/manager/signIn.dart';
import '../../cmn/view/nc_page.dart';

class MainPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create:
          (_) => MainViewModel(
        navigatorManager: navigatorManager,
        signInManager: locator<SignInManager>(),
      ),
      child: MainView(),
    );
  }
}