import 'package:flutter/material.dart';
import 'package:neighbor_chargers/gen/assets.gen.dart';
import 'package:neighbor_chargers/ui/splash/splash_viewmodel.dart';
import '../../cmn/view/nc_view.dart';

class SplashView extends NCView<SplashViewModel> {
  @override
  Widget draw() {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.splash.image(width: 320, height: 320),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.splashMiniCar.image(width: 54, height: 54),
            SizedBox(width: 8),
            Text(
              "이웃집 충전기",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF424242),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            viewModel.goLoginPage();
          },
          child: Text("Login >>"),
        ),
      ],
    );
  }
}
