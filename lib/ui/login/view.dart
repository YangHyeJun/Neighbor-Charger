import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neighbor_chargers/cmn/view/ui/appbar.dart';
import 'package:neighbor_chargers/ui/login/viewmodel.dart';

import '../../cmn/view/nc_view.dart';
import '../../cmn/view/ui/body.dart';
import '../../cmn/view/ui/page.dart';
import '../../gen/assets.gen.dart';

class LoginView extends NCView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget buildBody(BuildContext context, LoginViewModel viewModel) {
    return NCPage(
      appBar: NCAppBar(title: "로그인"),
      body: NCBody(child: body(viewModel)),
    );
  }

  Widget body(LoginViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 아이디
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "아이디를 입력하세요.",
                // errorText: "유효한 아이디 형식이 아닙니다.",
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
          // 비밀번호
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
            child: TextButton(
              onPressed: () {},
              child: Container(
                width: 294,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF9AE6B9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "로그인",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),

          // 회원가입 버튼
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(
              onPressed: () {},
              child: Container(
                width: 294,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Center(
                  child: Text(
                    "회원가입",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),

          // 네이버 로그인
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: TextButton(
              onPressed: () {},
              child: Container(
                width: 294,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.icon.naver.image(width: 24, height: 24),
                    SizedBox(width: 3),
                    Center(
                      child: Text(
                        "네이버",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 카카오 로그인
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(
              onPressed: () {},
              child: Container(
                width: 294,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.icon.kakao.image(width: 24, height: 24),
                    SizedBox(width: 3),
                    Center(
                      child: Text(
                        "카카오",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 페이스북 로그인
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(
              onPressed: () {},
              child: Container(
                width: 294,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.icon.facebook.image(width: 24, height: 24),
                    SizedBox(width: 3),
                    Center(
                      child: Text(
                        "페이스북",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
