import 'package:neighbor_chargers/cmn/viewmodel/nc_viewmodel.dart';
import '../../cmn/manager/navigator.dart';

class PhoneAuthViewModel extends NCViewModel {

  String? get phoneNumber => _phoneNumber;
  String? _phoneNumber;

  String? get mobileCarrier => _mobileCarrier;
  String? _mobileCarrier;

  bool get isPhoneNumberInput => _isPhoneNumberInput;
  bool _isPhoneNumberInput = false;

  PhoneAuthViewModel({required NavigatorManager navigatorManager});


  void inputPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
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
    navigatorManager.goSMSAuthPage();
  }
}
