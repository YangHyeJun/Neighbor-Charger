import 'package:neighbor_chargers/evCar/charging_type.dart';

class SignInManager {
  static final SignInManager _instance = SignInManager._internal();

  factory SignInManager() {
    return _instance;
  }

  SignInManager._internal();

  String? name;
  String? phoneNumber;
  String? residentNumberFront;
  String? residentNumberBack;
  String? mobileCarrier;
  String? accountNumber;
  String? bank;
  String? carType;
  List<ChargingType>? evChargeType;

  void setName(String value) => name = value;
  void setPhoneNumber(String value) => phoneNumber = value;
  void setResidentNumberFront(String value) => residentNumberFront = value;
  void setResidentNumberBack(String value) => residentNumberBack = value;
  void setMobileCarrier(String value) => mobileCarrier = value;
  void setAccountNumber(String value) => accountNumber = value;
  void setBank(String value) => bank = value;
  void setCarType(String value) => carType = value;
  void setEvChargeType(List<ChargingType> value) => evChargeType = value;

  // Map<String, String?> getSignUpData() {
  //   return {
  //     "name": name,
  //     "phoneNumber": phoneNumber,
  //     "residentNumberFront": residentNumberFront,
  //     "residentNumberBack": residentNumberBack,
  //     "mobileCarrier": mobileCarrier,
  //     "accountNumber": accountNumber,
  //     "bank": bank,
  //     "carType": carType,
  //     "evChargeType": evChargeType,
  //   };
  // }
}
