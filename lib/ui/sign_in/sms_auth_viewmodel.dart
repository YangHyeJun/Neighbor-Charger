import 'dart:async';
import 'package:neighbor_chargers/cmn/viewmodel/nc_viewmodel.dart';
import '../../cmn/manager/navigator.dart';

class SmsAuthViewModel extends NCViewModel {
  int remainingTime = 180;
  Timer? _timer;

  SmsAuthViewModel({required NavigatorManager navigatorManager}) {
    startTimer();
  }

  void startTimer() {
    notifyListeners();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        notifyListeners();
      } else {
        _timer?.cancel();
      }
    });
  }

  void goCarInfoPage() {
    navigatorManager.goCarInfoPage();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
