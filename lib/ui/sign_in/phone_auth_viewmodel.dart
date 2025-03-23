import 'package:neighbor_chargers/cmn/viewmodel/nc_viewmodel.dart';
import '../../cmn/manager/navigator.dart';
import '../../cmn/manager/signIn.dart';

class PhoneAuthViewModel extends NCViewModel {
  SignInManager signInManager;

  String? get phoneNumber => _phoneNumber;
  String? _phoneNumber;

  String? get mobileCarrier => _mobileCarrier;
  String? _mobileCarrier;

  bool get isPhoneNumberInput => _isPhoneNumberInput;
  bool _isPhoneNumberInput = false;

  bool get isAllInput =>
      _phoneNumber?.isNotEmpty == true &&
      _mobileCarrier?.isNotEmpty == true &&
      _phoneNumber?.length == 11;

  PhoneAuthViewModel({
    required NavigatorManager navigatorManager,
    required SignInManager signInManager,
  }) : signInManager = signInManager;

  void inputPhoneNumber(String phoneNumber) {
    // - , 공백 제거
    _phoneNumber = phoneNumber.replaceAll(RegExp(r'[-\s]'), '');
    notifyListeners();
  }

  void inputMobileCarrier(String mobileCarrier) {
    _mobileCarrier = mobileCarrier;
    notifyListeners();
  }

  void setPhoneNumber() {
    _isPhoneNumberInput = true;
    notifyListeners();
  }

  void goSMSAuthenticationPage() {
    // TODO : 문자 인증번호 보내기
    if (isAllInput) {
      signInManager.setPhoneNumber(_phoneNumber!);
      signInManager.setMobileCarrier(_mobileCarrier!);
      navigatorManager.goSMSAuthPage();
    }
  }
}
