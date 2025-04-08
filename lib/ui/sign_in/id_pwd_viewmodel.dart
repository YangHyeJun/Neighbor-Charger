import '../../cmn/manager/navigator.dart';
import '../../cmn/manager/signIn.dart';
import '../../cmn/viewmodel/nc_viewmodel.dart';

class IdPwdViewModel extends NCViewModel {
  final SignInManager signInManager;

  IdPwdViewModel({required NavigatorManager navigatorManager, required SignInManager signInManager})
    : signInManager = signInManager;
}
