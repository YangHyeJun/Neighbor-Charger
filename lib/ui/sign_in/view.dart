import 'package:flutter/material.dart';
import 'package:neighbor_chargers/cmn/view/ui/appbar.dart';
import 'package:neighbor_chargers/ui/sign_in/viewmodel.dart';
import '../../cmn/ui/button.dart';
import '../../cmn/view/nc_view.dart';

class SignInView extends NCView<SignInViewModel> {
  @override
  Widget draw() {
    return Scaffold(
      appBar: NCAppBar(title: "회원가입", leading: true),
      body: SafeArea(child: Stack(children: <Widget>[_draw()])),
    );
  }

  Widget _draw() {
    return Column(
      children: <Widget>[
        Expanded(child: body()),
        drawFooter(),
      ],
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35, bottom: 18),
            child: Text(
              '아이디 / 비밀번호',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 26.5,
                horizontal: 18,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('*', style: TextStyle(color: Colors.red)),
                          SizedBox(width: 4),
                          Text("아이디", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Container(
                        width: 165,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "아이디를 입력하세요.",
                            hintStyle: TextStyle(fontSize: 14),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('*', style: TextStyle(color: Colors.red)),
                          SizedBox(width: 4),
                          Text("비밀번호", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Container(
                        width: 165,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "비밀번호를 입력하세요.",
                            hintStyle: TextStyle(fontSize: 14),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('*', style: TextStyle(color: Colors.red)),
                          SizedBox(width: 4),
                          Text("비밀번호 확인", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Container(
                        width: 165,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "비밀번호를 입력하세요.",
                            hintStyle: TextStyle(fontSize: 14),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
        child: CMButton(
          text: "다음",
          onPressed: () {},
        ).successButton(),
      ),
    );
  }
}