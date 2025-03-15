import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neighbor_chargers/ui/sign_in/viewmodel.dart';
import '../../cmn/ui/button.dart';
import '../../cmn/ui/modal_bottom_sheet.dart';
import '../../cmn/view/nc_view.dart';
import '../../gen/assets.gen.dart';

class SignInView extends NCView<SignInViewModel> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController resident_front_number_controller = TextEditingController();
  TextEditingController resident_back_number_controller = TextEditingController();
  TextEditingController account_number_controller = TextEditingController();
  FocusNode residentBackFocusNode = FocusNode();
  FocusNode accountFocusNode = FocusNode();

  @override
  Widget draw() {
    return Scaffold(body: SafeArea(child: Stack(children: <Widget>[_draw()])));
  }

  Widget _draw() {
    return Column(
      children: <Widget>[
        Expanded(child: body()),
        // 이름 입력이 활성화된 경우에만 Footer를 표시
        if (viewModel.viewMode == ViewMode.name || viewModel.isAllInput) drawFooter(),
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
            Text(viewModel.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            if (viewModel.viewMode == ViewMode.accountNumber) ...[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 44),
                    child: Text("계좌번호", style: TextStyle(fontSize: 18, color: Color(0xFF9D9D9D))),
                  ),
                  // 계좌번호
                  TextField(
                    controller: account_number_controller,
                    focusNode: accountFocusNode,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              account_number_controller.text.isEmpty
                                  ? Color(0xFF18CB60)
                                  : Colors.black,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      viewModel.inputAccountNumber(value);
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero, // 기본 패딩 제거
                          title:
                              (viewModel.bankName == null || viewModel.bankName == '')
                                  ? Text(
                                    '은행을 선택해주세요.',
                                    style: TextStyle(fontSize: 16, color: Color(0xFF9D9D9D)),
                                  )
                                  : Text('${viewModel.bankName}'),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          onTap: () {
                            CMModalBottomSheet.show(context, bankSelectBottomSheet());
                          },
                        ),
                        Divider(
                          color: Colors.grey, // 밑줄 색상
                          thickness: 1, // 밑줄 두께
                          height: 1, // 밑줄과 리스트 간 간격 조절
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            // 주민등록번호를 입력하는 필드는 name이 입력된 후에 보여짐
            if (viewModel.viewMode == ViewMode.residentNumber ||
                viewModel.viewMode == ViewMode.accountNumber) ...[
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
                          FocusScope.of(context).requestFocus(accountFocusNode);
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
              onPressed: () {
                if (viewModel.viewMode == ViewMode.name) {
                  viewModel.inputName(name_controller.text);
                } else if (viewModel.isAllInput) {
                  viewModel.goPhoneCertification();
                }
                FocusScope.of(context).requestFocus(FocusNode());
              },
            ).successButton(),
      ),
    );
  }

  Widget bankSelectBottomSheet() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, top: 22, right: 28, bottom: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '은행을 선택해주세요.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xFF9D9D9D),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Assets.images.icon.xButton.image(width: 14, height: 14),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              banks(Assets.images.icon.bank.nonghyupBank.image(width: 28, height: 28), 'NH 농협'),
              banks(Assets.images.icon.bank.kakaoBank.image(width: 28, height: 28), '카카오뱅크'),
              banks(Assets.images.icon.bank.kookminBank.image(width: 28, height: 28), 'KB국민'),
              banks(Assets.images.icon.bank.ibkBank.image(width: 28, height: 28), 'IBK기업'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              banks(Assets.images.icon.bank.shinhanBank.image(width: 28, height: 28), '신한'),
              banks(Assets.images.icon.bank.tossBank.image(width: 28, height: 28), '토스뱅크'),
              banks(Assets.images.icon.bank.wooriBank.image(width: 28, height: 28), '우리'),
              banks(Assets.images.icon.bank.hanaBank.image(width: 28, height: 28), '하나'),
            ],
          ),
        ],
      ),
    );
  }

  Widget banks(Image bankImage, String bankName) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          viewModel.inputBank(bankName);
          print("Bank : $bankName");
        },
        child: Container(
          width: 76,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFF3F3F3),
          ),
          constraints: BoxConstraints(maxWidth: 76, maxHeight: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bankImage,
              SizedBox(height: 4),
              Text(bankName, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
