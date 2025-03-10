import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neighbor_chargers/cmn/ui/button.dart';
import 'package:neighbor_chargers/cmn/view/ui/appbar.dart';
import 'package:neighbor_chargers/ui/login/viewmodel.dart';

import '../../cmn/view/nc_view.dart';
import '../../gen/assets.gen.dart';

class LoginView extends NCView<LoginViewModel> {
  @override
  Widget draw() {
    return Scaffold(appBar: drawAppBar(), body: drawBody());
  }

  PreferredSizeWidget? drawAppBar() {
    return NCAppBar(title: "로그인");
  }

  Widget drawBody() {
    return body();
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 아이디 입력 필드
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "아이디를 입력하세요.",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
            ),
            // 비밀번호 입력 필드
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "비밀번호를 입력하세요.",
                  errorText: "비밀번호 항목은 필수 입력값입니다.",
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
            ),
            // 로그인 버튼
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CMButton(text: '로그인', onPressed: () {}).successButton(),
            ),
            // 회원가입 버튼
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CMButton(text: '회원가입', onPressed: () {
                viewModel.goSignInPage();
              }).commonButton(),
            ),
            // 네이버 로그인 버튼
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child:
                  CMButton(
                    text: '네이버',
                    image: Assets.images.icon.naver.image(
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {},
                  ).commonButton(),
            ),
            // 카카오 로그인 버튼
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child:
                  CMButton(
                    text: '카카오',
                    image: Assets.images.icon.kakao.image(
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {},
                  ).commonButton(),
            ),
            // 페이스북 로그인 버튼
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CMButton(
                text: '페이스북',
                image: Assets.images.icon.facebook.image(width: 24, height: 24),
                onPressed: (){},
              ).commonButton(),
            ),
          ],
        ),
      ),
    );
  }
}
