import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neighbor_chargers/cmn/view/nc_view.dart';
import 'package:neighbor_chargers/ui/main/viewmodel.dart';

import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';

class MainView extends NCView<MainViewModel> {
  @override
  Widget draw() {
    return Scaffold(body: SafeArea(child: Stack(children: <Widget>[_draw()])));
  }

  Widget _draw() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[header(), Expanded(child: body())],
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Assets.images.icon.logo.image(width: 32, height: 32),
          SizedBox(width: 9),
          Expanded(
            child: Text(
              '이웃집 충전기',
              style: TextStyle(
                fontSize: 24,
                fontFamily: FontFamily.cookieRun,
                color: Color(0xFF9D9D9D),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget body() {
    return Column(children: []);
  }
}
