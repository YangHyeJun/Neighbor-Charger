import 'package:flutter/material.dart';

import '../../ui/login/page.dart';

class NavigatorManager {
  // Navigator를 사용할 컨텍스트를 받도록 설정
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void pop() {
    navigatorKey.currentState?.pop();
  }

  // region: 로그인, 회원가입
  Future<dynamic> goLoginPage() {
    return navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (context) => LoginPage()),
        ) ??
        Future.value();
  }

  // endregion
}
