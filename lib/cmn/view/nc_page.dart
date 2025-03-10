import 'package:flutter/cupertino.dart';

import '../manager/navigator.dart';

abstract class NCPage extends StatelessWidget {
  late final NavigatorManager navigatorManager;
  bool _isCompletedSetup = false;

  @override
  Widget build(BuildContext context) {
    if (!_isCompletedSetup) {
      _setUp(context);
    }
    return Container();
  }

  void _setUp(BuildContext context) {
    navigatorManager = NavigatorManager(Navigator.of(context));
    _isCompletedSetup = true;
  }
}
