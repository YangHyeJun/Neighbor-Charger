import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neighbor_chargers/cmn/view/nc_view.dart';
import 'package:neighbor_chargers/ui/main/viewmodel.dart';

import '../../cmn/ui/buttonContainer.dart';
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
      children: <Widget>[header(), topNavigatorBar(), Expanded(child: body())],
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
          IconButton(onPressed: () {}, icon: Assets.images.icon.alarm.image(width: 24, height: 24)),
          IconButton(onPressed: () {}, icon: Assets.images.icon.list.image(width: 24, height: 24)),
        ],
      ),
    );
  }

  Widget topNavigatorBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            child: Text(
              '이웃집',
              style:
                  viewModel.section == BodySection.neighbor
                      ? theme.selectedGreenTitle
                      : theme.greyTitle,
            ),
            onPressed: () {
              viewModel.setSection(BodySection.neighbor);
            },
          ),
          SizedBox(width: 10),
          TextButton(
            child: Text(
              '내집',
              style:
                  viewModel.section == BodySection.me ? theme.selectedGreenTitle : theme.greyTitle,
            ),
            onPressed: () {
              viewModel.setSection(BodySection.me);
            },
          ),
        ],
      ),
    );
  }

  Widget body() {
    if (viewModel.section == BodySection.neighbor) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('개인 충전기', style: theme.blackTitle),
                    SizedBox(height: 8),
                    ButtonContainer(
                      title: '개인 충전기만 보기',
                      image: Assets.images.personalCharger.image(width: 104, height: 64),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('공용 충전소', style: theme.blackTitle),
                    SizedBox(height: 8),
                    ButtonContainer(
                      title: '공용 충전소만 보기',
                      image: Assets.images.publicCharger.image(width: 104, height: 64),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ButtonFullContainer(
              title: '내 주변 충전기',
              onPressed: () {
                /// TODO
              },
              image: null,
            ),
            SizedBox(height: 20),
            Text('리뷰', style: theme.blackTitle),
            SizedBox(height: 8),
            ButtonFullContainer(
              title: '내가 쓴 리뷰 보기',
              content: '(3.5) 충전기 주인분이 친절해요 그런데 약간 아쉬운게 있어요, 뭐냐하면',
              onPressed: () {
                /// TODO
              },
              image: Assets.images.myReview.image(width: 73, height: 73),
            ),

            // 뉴스
            SizedBox(height: 20),
            Text('뉴스', style: theme.blackTitle),
            SizedBox(height: 8),
            ButtonFullContainer(
              title: '뉴스 API 연동 필요',
              onPressed: () {
                /// TODO
              },
            ),
          ],
        ),
      );
    }
    return SizedBox.shrink();
  }
}
