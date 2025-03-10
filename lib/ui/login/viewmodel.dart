import 'package:neighbor_chargers/cmn/viewmodel/nc_viewmodel.dart';

import '../../cmn/manager/navigator.dart';

class LoginViewModel extends NCViewModel {
  LoginViewModel({required NavigatorManager navigatorManager}) {
    print("THIS IS LOGIN VIEWMODEL");
  }

  Future<void> goSignInPage() async{
    navigatorManager.goSignInPage();
  }
}

// class SettingViewModel extends FMBaseViewModel with WidgetsBindingObserver {
//   final AppManager _appManager;
//   final AuthManager _authManager;
//   final UserService _userService;
//
//   bool get isOnReceiveNotification => _isOnReceiveNotification;
//   bool _isOnReceiveNotification = false;
//   String appVersion = '';
//   String buildNumber = '1';
//
//   bool get isManagedMode => _isManagedMode;
//   bool _isManagedMode = false;
//
//   User? get loggedInUser => _loggedInUser;
//   User? _loggedInUser;
//
//   get siteName => _authManager.current.server.name;
//
//   bool get currentNotificationType =>
//       _appManager.isCurrentServerNotificationOn.value;
//
//   bool get isOtherServerHasUnreadMessage =>
//       _appManager.isOtherServerHasUnreadMessage.value;
//
//   ServerType get serverType =>
//       _authManager.current.server.serverSystemInfo.serverType;
//
//   ChatStompClient? get _socketClient => _appManager.currentChatSocket;
//   StreamSubscription? _eventSubscription;
//
//   String? get loggedInUserStateName => _loggedInUserStateName;
//   String? _loggedInUserStateName;
//
//   bool get isProfileImageSupport =>
//       _authManager
//           .current
//           .server
//           .serverSystemInfo
//           .supportFunctions
//           .userProfileImage;
//
//   bool get isProfileStateSupport =>
//       _authManager
//           .current
//           .server
//           .serverSystemInfo
//           .supportFunctions
//           .userProfileState;
//
//   bool get isProfileStateMessageSupport =>
//       _authManager
//           .current
//           .server
//           .serverSystemInfo
//           .supportFunctions
//           .userProfileStateMessage;
//
//   bool get isNotificationPausedAvailable =>
//       _authManager
//           .current
//           .server
//           .serverSystemInfo
//           .supportFunctions
//           .notificationPausedAvailable;
//
//   SettingViewModel({
//     required FMDialog dialog,
//     required FMNavigatorManager navigatorManager,
//     AppManager? appManager,
//     AuthManager? authManager,
//     UserService? userService,
//   }) : _appManager = appManager ?? AppManager.instance,
//        _authManager = authManager ?? AuthManager.instance,
//        _userService = userService ?? locator.get<UserService>(),
//        super(dialog, navigatorManager) {
//     WidgetsBinding.instance.addObserver(this);
//     _loadData();
//     Future(() => _subscribeEvent());
//     _appManager.isOtherServerHasUnreadMessage.addListener(() {
//       notifyListeners();
//     });
//   }
// }
