import 'package:flutter/cupertino.dart';
import 'package:neighbor_chargers/ui/onBoarding/view.dart';
import 'package:neighbor_chargers/ui/onBoarding/viewmodel.dart';
import 'package:provider/provider.dart';

import '../../cmn/view/nc_page.dart';

class OnBoardingPage extends NCPage {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<OnBoardingViewModel>(
      create: (_) => OnBoardingViewModel(navigatorManager: navigatorManager),
      child: OnBoardingView(),
    );
  }
}