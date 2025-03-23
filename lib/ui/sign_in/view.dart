import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neighbor_chargers/ui/sign_in/viewmodel.dart';
import '../../cmn/ui/button.dart';
import '../../cmn/view/nc_view.dart';

class SignInView extends NCView<SignInViewModel> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController resident_front_number_controller = TextEditingController();
  TextEditingController resident_back_number_controller = TextEditingController();
  FocusNode residentBackFocusNode = FocusNode();

  @override
  Widget draw() {
    return Scaffold(body: SafeArea(child: Stack(children: <Widget>[_draw()])));
  }

  Widget _draw() {
    return Column(
      children: <Widget>[
        Expanded(child: body()),
        // 이름 입력이 활성화된 경우에만 Footer를 표시
        if (viewModel.viewMode == SignInViewMode.name || viewModel.isAllInput) drawFooter(),
      ],
    );
  }

  Widget body() {
    Color borderColor(int maxLength, TextEditingController controller) {
      if (controller.text.length == maxLength) {
        return Colors.black;
      } else if (controller.text.isEmpty) {
        return Colors.grey;
      } else {
        return Colors.red;
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 36, top: 50, right: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title은 viewModel에서 관리
            Text.rich(
              TextSpan(
                children: [
                  if (viewModel.viewMode == SignInViewMode.name) ...[
                    TextSpan(
                      text: '이름',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF23B05C)),
                    ),
                    TextSpan(
                      text: viewModel.title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ] else if (viewModel.viewMode == SignInViewMode.residentNumber)...[
                    TextSpan(
                      text: '주민등록번호',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF23B05C)),
                    ),
                    TextSpan(
                      text: viewModel.title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ]
                ],
              ),
            ),

            // 주민등록번호를 입력하는 필드는 name이 입력된 후에 보여짐
            if (viewModel.viewMode == SignInViewMode.residentNumber) ...[
              Padding(
                padding: const EdgeInsets.only(top: 44),
                child: Text("주민등록번호", style: TextStyle(fontSize: 18, color: Color(0xFF9D9D9D))),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLength: 6,
                      controller: resident_front_number_controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor(6, resident_front_number_controller),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor(6, resident_front_number_controller),
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        viewModel.inputResidentFrontNumber(value);
                        if (value.length == 6) {
                          Future.delayed(Duration(milliseconds: 100), () {
                            FocusScope.of(context).requestFocus(residentBackFocusNode);
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 15),
                  Text('ㅡ', style: TextStyle(fontSize: 22, color: Color(0xFF9D9D9D))),
                  SizedBox(width: 15),
                  Flexible(
                    child: SizedBox(
                      width: 20,
                      child: TextField(
                        maxLength: 1,
                        controller: resident_back_number_controller,
                        focusNode: residentBackFocusNode,
                        // 추가
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          counterText: '',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  resident_back_number_controller.text.isEmpty
                                      ? Colors.grey
                                      : Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  resident_back_number_controller.text.isEmpty
                                      ? Colors.grey
                                      : Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          viewModel.inputResidentBackNumber(value);
                        },
                      ),
                    ),
                  ),
                  Text(
                    "⦁ ⦁ ⦁ ⦁ ⦁ ⦁",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9D9D9D),
                    ),
                  ),
                ],
              ),
            ],

            Padding(
              padding: const EdgeInsets.only(top: 44),
              child: Text("이름", style: TextStyle(fontSize: 18, color: Color(0xFF9D9D9D))),
            ),
            // 이름
            TextField(
              maxLength: 4,
              controller: name_controller,
              decoration: InputDecoration(
                counterText: '',
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              onChanged: (value) {
                viewModel.inputNameRealTime(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget drawFooter() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: CMButton(
              text: "확인",
              isDeactivate: viewModel.name == null || viewModel.name == '' ? true : false,
              onPressed: () {
                if (viewModel.viewMode == SignInViewMode.name) {
                  viewModel.inputName(name_controller.text);
                } else if (viewModel.isAllInput) {
                  viewModel.goPhoneAuthentication();
                }
                FocusScope.of(context).requestFocus(FocusNode());
              },
            ).successButton(),
      ),
    );
  }
}
