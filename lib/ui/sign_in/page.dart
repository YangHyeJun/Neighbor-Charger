import 'package:flutter/cupertino.dart';
import 'package:neighbor_chargers/ui/sign_in/phone_auth_view.dart';
import 'package:neighbor_chargers/ui/sign_in/phone_auth_viewmodel.dart';
import 'package:neighbor_chargers/ui/sign_in/sms_auth_view.dart';
import 'package:neighbor_chargers/ui/sign_in/sms_auth_viewmodel.dart';
import 'package:neighbor_chargers/ui/sign_in/view.dart';
import 'package:neighbor_chargers/ui/sign_in/viewmodel.dart';
import 'package:provider/provider.dart';

import '../../cmn/view/nc_page.dart';

class SignInPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => SignInViewModel(navigatorManager: navigatorManager),
      child: SignInView(),
    );
  }
}

class PhoneAuthPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => PhoneAuthViewModel(navigatorManager: navigatorManager),
      child: PhoneAuthView(),
    );
  }
}

class SMSAuthPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => SmsAuthViewModel(navigatorManager: navigatorManager),
      child: SmsAuthView(),
    );
  }
}
