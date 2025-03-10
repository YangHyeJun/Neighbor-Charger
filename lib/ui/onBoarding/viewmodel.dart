import 'package:neighbor_chargers/cmn/viewmodel/nc_viewmodel.dart';

import '../../cmn/manager/navigator.dart';

class OnBoardingViewModel extends NCViewModel {
  OnBoardingViewModel({required NavigatorManager navigatorManager}) {
    print("THIS IS ONBOARDING VIEWMODEL");
  }

  Future<void> goLoginPage() async{
    navigatorManager.goLoginPage();
  }
}