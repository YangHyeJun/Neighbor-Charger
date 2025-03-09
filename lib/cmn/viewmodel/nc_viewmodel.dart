import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../manager/navigator.dart';

class NCViewModel extends ChangeNotifier {
  late final NavigatorManager _navigatorManager;

  NCViewModel() {
    _navigatorManager = GetIt.I<NavigatorManager>();
  }

  NavigatorManager get navigatorManager => _navigatorManager;
}
