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

  ViewMode viewMode = ViewMode.name;

  SignInViewModel({required NavigatorManager navigatorManager});

  void inputName(String name) {
    _name = name;
    if (_name != null && _name!.isNotEmpty) {
      setViewMode(ViewMode.residentNumber);
    }
    notifyListeners();
  }

  void inputResidentFrontNumber(String number) {
    _residentFrontNumber = number;
    if (_residentFrontNumber != null &&
        _residentFrontNumber!.length == 6 &&
        _residentBackNumber != null &&
        _residentBackNumber!.isNotEmpty) {
      setViewMode(ViewMode.accountNumber);
    }
    notifyListeners();
  }

  void inputResidentBackNumber(String number) {
    _residentBackNumber = number;
    if (_residentFrontNumber != null &&
        _residentFrontNumber!.length == 6 &&
        _residentBackNumber != null &&
        _residentBackNumber!.isNotEmpty) {
      setViewMode(ViewMode.accountNumber);
    }
    notifyListeners();
  }

  void inputAccountNumber(String accountNumber) {
    _accountNumber = accountNumber;
    if (_accountNumber != null && _accountNumber!.length > 8 && _accountNumber != '') {
      setViewMode(ViewMode.carrierSelection);
    }
    notifyListeners();
  }

  // viewMode를 업데이트하는 함수
  void setViewMode(ViewMode nextViewMode) {
    viewMode = nextViewMode;
    notifyListeners();
  }

  String get title {
    switch (viewMode) {
      case ViewMode.name:
        return '이름을 입력해 주세요.';
      case ViewMode.residentNumber:
        return '주민등록번호를 입력해주세요.';
      case ViewMode.accountNumber:
        return '판매자에게 보여줄 계좌번호를 입력해주세요.';
      case ViewMode.carrierSelection:
        return '통신사를 선택해 주세요.';
      default:
        return '이름을 입력해 주세요.';
    }
  }
}

enum ViewMode {
  name, // 이름을 입력하는 단계
  residentNumber, // 주민등록번호를 입력하는 단계
  accountNumber, // 계좌번호를 입력하는 단계
  carrierSelection, // 통신사를 선택하는 단계
}
