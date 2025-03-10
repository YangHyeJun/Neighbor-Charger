import 'package:flutter/cupertino.dart';
import 'package:neighbor_chargers/cmn/viewmodel/nc_viewmodel.dart';

import '../../cmn/manager/navigator.dart';


class SplashViewModel extends NCViewModel {

  // TODO : 로그인 전적 확인, 사용자 정보 가져오기
  SplashViewModel({required NavigatorManager navigatorManager});

  Future<void> goLoginPage() async {
    print("To Login Page");
    navigatorManager.goLoginPage();
  }
}