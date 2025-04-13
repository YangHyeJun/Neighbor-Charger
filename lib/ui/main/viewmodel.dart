import '../../cmn/manager/navigator.dart';
import '../../cmn/manager/signIn.dart';
import '../../cmn/viewmodel/nc_viewmodel.dart';

class MainViewModel extends NCViewModel {
  final SignInManager signInManager;

  BodySection? get section => _section;
  BodySection? _section;

  MainViewModel({required NavigatorManager navigatorManager, required SignInManager signInManager})
    : signInManager = signInManager {

    _init();
  }

  void _init() {
    _section ??= BodySection.me;
  }

  void setSection(BodySection section) {
    _section = section;
    notifyListeners();
  }
}


enum BodySection {
  neighbor,
  me
}
