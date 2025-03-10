import 'package:flutter/material.dart';

import '../../ui/login/page.dart';
import '../../ui/sign_in/page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigatorManager {
  final NavigatorState? currentNavigatorState;

  NavigatorManager([this.currentNavigatorState]);

  void pop<T extends Object>([T? result]) {
    if (currentNavigatorState?.canPop() ?? false) {
      currentNavigatorState?.pop(result);
    }
  }

  // 로그인
  Future<dynamic> goLoginPage() {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => LoginPage()),
    ) ??
        Future.value();
  }
  // 회원가입
  Future<dynamic> goSignInPage() {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => SignInPage()),
    ) ??
        Future.value();
  }
}