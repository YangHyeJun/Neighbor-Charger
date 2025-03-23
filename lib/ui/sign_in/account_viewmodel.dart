import 'package:neighbor_chargers/cmn/manager/signIn.dart';

import '../../cmn/manager/navigator.dart';
import '../../cmn/viewmodel/nc_viewmodel.dart';

class AccountViewModel extends NCViewModel {
  final SignInManager signInManager;

  String? get accountNumber => _accountNumber;
  String? _accountNumber;

  String? get bankName => _bankName;
  String? _bankName;

  bool get isAllInput => _accountNumber?.isNotEmpty == true && _bankName?.isNotEmpty == true;

  AccountViewModel(
      {required NavigatorManager navigatorManager, required SignInManager signInManager})
      : signInManager = signInManager;


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

  void goMainPage() {
    if (isAllInput) {
      signInManager.setAccountNumber(_accountNumber!);
      signInManager.setBank(_bankName!);
    }
    // viewModel.goMainPage();
  }
}