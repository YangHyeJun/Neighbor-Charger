import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neighbor_chargers/ui/sign_in/account_viewmodel.dart';

import '../../cmn/ui/button.dart';
import '../../cmn/ui/modal_bottom_sheet.dart';
import '../../cmn/view/nc_view.dart';
import '../../gen/assets.gen.dart';

class AccountView extends NCView<AccountViewModel> {
  TextEditingController account_number_controller = TextEditingController();
  FocusNode accountFocusNode = FocusNode();

  @override
  Widget draw() {
    return Scaffold(body: SafeArea(child: Stack(children: <Widget>[_draw()])));
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 36, top: 50, right: 44),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('마지막으로,', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '계좌번호',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF23B05C),
                    ),
                  ),
                  TextSpan(
                    text: '를 입력해주세요',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
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
                  borderSide: BorderSide(color: Colors.black, width: 2),
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
                    contentPadding: EdgeInsets.zero,
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
                  onTap: () {
                    /// TODO : modal sheet 내리기
                  },
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

  Widget drawFooter() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                viewModel.goMainPage();
              },
              child: Container(
                child: Text(
                  '다음에 입력할게요.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9D9D9D),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF9D9D9D),
                    decorationThickness: 1,
                  ),
                ),
              ),
            ),
            CMButton(
              text: "확인",
              isDeactivate: viewModel.isAllInput ? false : true,
              onPressed: () {
                viewModel.goMainPage();
              },
            ).successButton(),
          ],
        ),
      ),
    );
  }
}