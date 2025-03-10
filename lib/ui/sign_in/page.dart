import 'package:flutter/cupertino.dart';
import 'package:neighbor_chargers/ui/sign_in/view.dart';
import 'package:neighbor_chargers/ui/sign_in/viewmodel.dart';
import 'package:provider/provider.dart';

import '../../cmn/view/nc_page.dart';

class SignInPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<SignInViewModel> (
      create: (_) => SignInViewModel(navigatorManager: navigatorManager),
      child: SignInView(),
    );
  }
}