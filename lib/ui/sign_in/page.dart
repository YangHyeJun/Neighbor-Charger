import 'package:flutter/cupertino.dart';
import 'package:neighbor_chargers/ui/sign_in/carInfo_viewmodel.dart';
import 'package:neighbor_chargers/ui/sign_in/id_pwd_view.dart';
import 'package:neighbor_chargers/ui/sign_in/phone_auth_view.dart';
import 'package:neighbor_chargers/ui/sign_in/phone_auth_viewmodel.dart';
import 'package:neighbor_chargers/ui/sign_in/sms_auth_view.dart';
import 'package:neighbor_chargers/ui/sign_in/sms_auth_viewmodel.dart';
import 'package:neighbor_chargers/ui/sign_in/view.dart';
import 'package:neighbor_chargers/ui/sign_in/viewmodel.dart';
import 'package:provider/provider.dart';

import '../../cmn/locator.dart';
import '../../cmn/manager/signIn.dart';
import '../../cmn/view/nc_page.dart';
import 'account_view.dart';
import 'account_viewmodel.dart';
import 'carInfo_view.dart';
import 'id_pwd_viewmodel.dart';

class SignInPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create:
          (_) => SignInViewModel(
            navigatorManager: navigatorManager,
            signInManager: locator<SignInManager>(),
          ),
      child: SignInView(),
    );
  }
}

class PhoneAuthPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create:
          (_) => PhoneAuthViewModel(
            navigatorManager: navigatorManager,
            signInManager: locator<SignInManager>(),
          ),
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

class AccountPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create:
          (_) => AccountViewModel(
            navigatorManager: navigatorManager,
            signInManager: locator<SignInManager>(),
          ),
      child: AccountView(),
    );
  }
}

class CarInfoPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create:
          (_) => CarInfoViewModel(
            navigatorManager: navigatorManager,
            signInManager: locator<SignInManager>(),
          ),
      child: CarInfoView(),
    );
  }
}

class IdPwdPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create:
          (_) => IdPwdViewModel(
        navigatorManager: navigatorManager,
        signInManager: locator<SignInManager>(),
      ),
      child: IdPwdView(),
    );
  }
}