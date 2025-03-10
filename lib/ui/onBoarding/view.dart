import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neighbor_chargers/cmn/ui/button.dart';
import 'package:neighbor_chargers/ui/onBoarding/viewmodel.dart';

import '../../cmn/view/nc_view.dart';
import '../../gen/assets.gen.dart';

class OnBoardingView extends NCView<OnBoardingViewModel> {
  @override
  Widget draw() {
    return Scaffold(body: SafeArea(child: Stack(children: <Widget>[_draw()])));
  }

  Widget _draw() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Expanded(child: drawBody()), drawFooter()],
    );
  }

  Widget drawBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 33),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '전기차 충전을\n이웃집 충전기로 간편하게',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 46),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '공용 충전소',
                  style: TextStyle(
                    color: Color(0XFF5697FF),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '와 ',
                  style: TextStyle(
                    color: Color(0xFF9D9D9D),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '이웃집 충전기',
                  style: TextStyle(
                    color: Color(0XFF23B05C),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '를\n한 곳에서',
                  style: TextStyle(
                    color: Color(0xFF9D9D9D),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawFooter() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.splashMiniCar.image(width: 33, height: 33),
                SizedBox(width: 13),
                Text(
                  '이웃집 충전기',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9D9D9D),
                  ),
                ),
              ],
            ),
            SizedBox(height: 17),
            CMButton(text: "다음", onPressed: () {
              viewModel.goLoginPage();
            }).successButton(),
          ],
        ),
      ),
    );
  }
}
