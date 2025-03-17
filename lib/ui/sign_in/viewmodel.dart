import 'package:neighbor_chargers/cmn/viewmodel/nc_viewmodel.dart';
import '../../cmn/manager/navigator.dart';

class SignInViewModel extends NCViewModel {
  String? get name => _name;
  String? _name;

  String? get residentFrontNumber => _residentFrontNumber;
  String? _residentFrontNumber;

  String? get residentBackNumber => _residentBackNumber;
  String? _residentBackNumber;

  String? get accountNumber => _accountNumber;
  String? _accountNumber;

  String? get bankName => _bankName;
  String? _bankName;

  SignInViewMode viewMode = SignInViewMode.name;

  bool get isAllInput =>
      _name?.isNotEmpty == true &&
      _residentFrontNumber?.isNotEmpty == true &&
      _residentBackNumber?.isNotEmpty == true &&
      _accountNumber?.isNotEmpty == true &&
      _bankName?.isNotEmpty == true;

  SignInViewModel({required NavigatorManager navigatorManager});

  void inputName(String name) {
    _name = name;
    if (_name != null && _name!.isNotEmpty) {
      setViewMode(SignInViewMode.residentNumber);
    }
    notifyListeners();
  }

  void inputResidentFrontNumber(String number) {
    _residentFrontNumber = number;
    if (_residentFrontNumber != null &&
        _residentFrontNumber!.length == 6 &&
        _residentBackNumber != null &&
        _residentBackNumber!.isNotEmpty) {
      setViewMode(SignInViewMode.accountNumber);
    }
    notifyListeners();
  }

  void inputResidentBackNumber(String number) {
    _residentBackNumber = number;
    if (_residentFrontNumber != null &&
        _residentFrontNumber!.length == 6 &&
        _residentBackNumber != null &&
        _residentBackNumber!.isNotEmpty) {
      setViewMode(SignInViewMode.accountNumber);
    }
    notifyListeners();
  }

  // 계좌번호 입력받기
  void inputAccountNumber(String accountNumber) {
    _accountNumber = accountNumber;
    notifyListeners();
  }

  // 선택된 은행 입력받기
  void inputBank(String bankName) {
    if (bankName != '' && bankName.isNotEmpty) {
      _bankName = bankName;
    }
    notifyListeners();
  }

  // viewMode를 업데이트하는 함수
  void setViewMode(SignInViewMode nextViewMode) {
    viewMode = nextViewMode;
    notifyListeners();
  }

  void goPhoneAuthentication() {
    navigatorManager.goPhoneAuthPage();
  }

  String get title {
    switch (viewMode) {
      case SignInViewMode.name:
        return '이름을 입력해 주세요.';
      case SignInViewMode.residentNumber:
        return '주민등록번호를 입력해주세요.';
      case SignInViewMode.accountNumber:
        return '판매자에게 보여줄 계좌번호를\n입력해주세요.';
    }
  }
}

enum SignInViewMode {
  name, // 이름을 입력하는 단계
  residentNumber, // 주민등록번호를 입력하는 단계
  accountNumber, // 계좌번호를 입력하는 단계
}
