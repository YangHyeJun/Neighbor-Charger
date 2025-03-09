import 'package:flutter/cupertino.dart';
import 'package:neighbor_chargers/ui/login/view.dart';
import 'package:neighbor_chargers/ui/login/viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      builder: (context, child) => LoginView(),
    );
  }
}
