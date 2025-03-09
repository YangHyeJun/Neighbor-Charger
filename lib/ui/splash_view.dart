import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cmn/ui/body.dart';
import '../cmn/ui/page.dart';
import '../gen/assets.gen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return NCPage(
      body: NCBody(child: body()),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.images.splash.image(width: 320, height: 320)
      ],
    );
  }
}