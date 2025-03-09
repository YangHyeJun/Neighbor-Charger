import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../cmn/view/ui/body.dart';
import '../../cmn/view/ui/page.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return NCPage(body: NCBody(child: body()));
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Login Page")
      ],
    );
  }
}
