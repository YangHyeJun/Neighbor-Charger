import 'package:flutter/cupertino.dart';
import 'package:neighbor_chargers/ui/login/view.dart';
import 'package:neighbor_chargers/ui/login/viewmodel.dart';
import 'package:provider/provider.dart';

import '../../cmn/view/nc_page.dart';

class LoginPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(navigatorManager: navigatorManager),
      child: LoginView(),
    );
  }
}