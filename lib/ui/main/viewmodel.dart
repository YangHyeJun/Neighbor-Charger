import '../../cmn/manager/navigator.dart';
import '../../cmn/manager/signIn.dart';
import '../../cmn/viewmodel/nc_viewmodel.dart';

class MainViewModel extends NCViewModel {
  final SignInManager signInManager;

  MainViewModel({required NavigatorManager navigatorManager, required SignInManager signInManager})
    : signInManager = signInManager;
}
