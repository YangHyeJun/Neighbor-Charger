import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neighbor_chargers/cmn/ui/button.dart';
import 'package:neighbor_chargers/cmn/ui/modal_bottom_sheet.dart';
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
            CMButton(
              text: "다음",
              onPressed: () {
                CMModalBottomSheet.show(context, _buildModalContent());
              },
            ).successButton(),
          ],
        ),
      ),
    );
  }
  Widget _buildModalContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeaderText(),
        SizedBox(height: 32),
        _buildPermissionList(),
        Padding(
          padding: const EdgeInsets.only(top:50, bottom: 24),
          child: Center(
            child: CMButton(
              text: '완료',
              onPressed: () {},
            ).successButton(),
          ),
        ),
      ],
    );
  }


  Widget _buildHeaderText() {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 24),
      child: Text(
        '앱 사용을 위해\n아래 권한을 허용해 주세요',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPermissionList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32,),
      child: Column(
        children: [
          _buildPermissionRow(
            icon: Assets.images.icon.notification.image(width: 41, height: 41),
            title: '알림',
            description: '충전 상태에 대한 알림을 받을 수 있습니다.',
          ),
          SizedBox(height: 28),
          _buildPermissionRow(
            icon: Assets.images.icon.location.image(width: 41, height: 41),
            title: '위치',
            description: '지도에서 실시간 위치를 확인하고\n주변 충전소를 확인할 수 있습니다.',
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionRow({
    required Image icon,
    required String title,
    required String description,
  }) {
    return Row(
      children: [
        icon,
        SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
