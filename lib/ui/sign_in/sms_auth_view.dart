import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neighbor_chargers/ui/sign_in/sms_auth_viewmodel.dart';
import '../../cmn/ui/button.dart';
import '../../cmn/view/nc_view.dart';

class SmsAuthView extends NCView<SmsAuthViewModel> {
  TextEditingController smsAuth_controller = TextEditingController();

  @override
  Widget draw() {
    return Scaffold(body: SafeArea(child: Stack(children: <Widget>[_draw()])));
  }

  Widget _draw() {
    return Column(children: <Widget>[Expanded(child: body()), drawFooter()]);
  }

  Widget body() {

    int minutes = viewModel.remainingTime ~/ 60;
    int seconds = viewModel.remainingTime % 60;
    String formattedTime = '$minutes:${seconds.toString().padLeft(2, '0')}';


    return Padding(
      padding: const EdgeInsets.only(left: 36, top: 50, right: 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '문자로 전송된\n인증번호를 입력해주세요.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 52),
          Stack(
            children: [
              TextField(
                maxLength: 6,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: smsAuth_controller,
                decoration: InputDecoration(
                  counterText: '',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                onChanged: (value) {},
              ),
              Positioned(
                right: 0,
                bottom: 10,
                child: Text(
                  formattedTime,
                  style: TextStyle(fontSize: 18, color: Color(0xFF9D9D9D)),
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFE6E6E6)
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: GestureDetector(
              onTap: () {
                // TODO : 인증 문자 다시 보내기
              },
              child: Text(
                "인증 문자 다시 보내기",
                style: TextStyle(fontSize: 14, color: Color(0xFF515151)),
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
        child:
            CMButton(
              text: "확인",
              onPressed: () {
                // TODO : 자동차 정보 입력받는 화면으로 이동
              },
            ).successButton(),
      ),
    );
  }
}
