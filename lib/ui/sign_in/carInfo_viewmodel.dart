import '../../cmn/manager/navigator.dart';
import '../../cmn/manager/signIn.dart';
import '../../cmn/viewmodel/nc_viewmodel.dart';
import '../../evCar/charging_type.dart';

class CarInfoViewModel extends NCViewModel {
  String name;
  final SignInManager signInManager;

  List<ChargingType> chargingTypes = ChargingType.values;

  List<ChargingType>? get selectedChargingTypes => _selectedChargingTypes;
  List<ChargingType>? _selectedChargingTypes = [];

  String? get carName => _carName;
  String? _carName;

  CarInfoViewModel({
    required NavigatorManager navigatorManager,
    required SignInManager signInManager,
  })
      : name = signInManager.name!,
        signInManager = signInManager;

  void setCarName(String name) {
    _carName = name;
    notifyListeners();
  }

  void setSelectedChargingType(ChargingType type, bool isSelected) {
    if (isSelected) {
      _selectedChargingTypes?.add(type);
    } else {
      _selectedChargingTypes?.remove(type);
    }
    notifyListeners();
  }

  bool isChargingTypeSelected(ChargingType type) {
    return _selectedChargingTypes?.contains(type) ?? false;
  }

  void goAccountPage() {
    if (_carName != null && _carName != '') {
      signInManager.setCarType(_carName!);
    }
    navigatorManager.goAccountPage();
  }
}