import 'package:neighbor_chargers/cmn/viewmodel/nc_viewmodel.dart';
import '../../cmn/manager/navigator.dart';
import '../../cmn/manager/signIn.dart';

class SignInViewModel extends NCViewModel {
  final SignInManager signInManager;

  String? get name => _name;
  String? _name;

  String? get residentFrontNumber => _residentFrontNumber;
  String? _residentFrontNumber;

  String? get residentBackNumber => _residentBackNumber;
  String? _residentBackNumber;

  SignInViewMode viewMode = SignInViewMode.name;

  bool get isAllInput =>
      _name?.isNotEmpty == true &&
      _residentFrontNumber?.isNotEmpty == true &&
      _residentFrontNumber?.length == 6 &&
      _residentBackNumber?.isNotEmpty == true;

  SignInViewModel({
    required NavigatorManager navigatorManager,
    required SignInManager signInManager,
  }) : signInManager = signInManager;

  void inputName(String name) {
    _name = name;
    if (_name != null && _name!.isNotEmpty) {
      setViewMode(SignInViewMode.residentNumber);
    }
    notifyListeners();
  }

  void inputNameRealTime(String name) {
    _name = name;
    notifyListeners();
  }

  void inputResidentFrontNumber(String number) {
    _residentFrontNumber = number;
    if (_residentFrontNumber != null &&
        _residentFrontNumber!.length == 6 &&
        _residentBackNumber != null &&
        _residentBackNumber!.isNotEmpty) {}
    notifyListeners();
  }

  void inputResidentBackNumber(String number) {
    _residentBackNumber = number;
    if (_residentFrontNumber != null &&
        _residentFrontNumber!.length == 6 &&
        _residentBackNumber != null &&
        _residentBackNumber!.isNotEmpty) {}
    notifyListeners();
  }

  // viewMode를 업데이트하는 함수
  void setViewMode(SignInViewMode nextViewMode) {
    viewMode = nextViewMode;
    notifyListeners();
  }

  void goPhoneAuthentication() {
    if (isAllInput) {
      signInManager.setName(_name!);
      signInManager.setResidentNumberFront(_residentFrontNumber!);
      signInManager.setResidentNumberBack(_residentBackNumber!);
      navigatorManager.goPhoneAuthPage();
    } else {
      // TODO : 모든게 입력되지 않았을 경우 (dialog로 표시)
    }
  }

  String get title {
    switch (viewMode) {
      case SignInViewMode.name:
        return '을 입력해 주세요.';
      case SignInViewMode.residentNumber:
        return '를 입력해주세요.';
    }
  }
}

enum SignInViewMode {
  name, // 이름을 입력하는 단계
  residentNumber, // 주민등록번호를 입력하는 단계
}
