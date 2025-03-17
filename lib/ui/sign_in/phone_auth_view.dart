import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neighbor_chargers/ui/sign_in/phone_auth_viewmodel.dart';
import '../../cmn/ui/button.dart';
import '../../cmn/ui/modal_bottom_sheet.dart';
import '../../cmn/view/nc_view.dart';
import '../../gen/assets.gen.dart';

class PhoneAuthView extends NCView<PhoneAuthViewModel> {
  TextEditingController phoneNumber_controller = TextEditingController();

  @override
  Widget draw() {
    return Scaffold(body: SafeArea(child: Stack(children: <Widget>[_draw()])));
  }

  Widget _draw() {
    return Column(children: <Widget>[Expanded(child: body()), drawFooter()]);
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.only(left: 36, top: 50, right: 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '본인인증을 위해\n아래 정보를 입력해주세요.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 44),
            child: Text("휴대폰 번호", style: TextStyle(fontSize: 18, color: Color(0xFF9D9D9D))),
          ),
          // 이름
          TextField(
            maxLength: 11,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: phoneNumber_controller,
            decoration: InputDecoration(
              counterText: '',
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            onChanged: (value) {
              viewModel.inputPhoneNumber(value);
              phoneNumber_controller.text = value;
            },
          ),

          if (viewModel.isPhoneNumberInput == true) ...[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title:
                        (viewModel.mobileCarrier == null || viewModel.mobileCarrier == '')
                            ? Text(
                              '통신사를 선택해주세요.',
                              style: TextStyle(fontSize: 16, color: Color(0xFF9D9D9D)),
                            )
                            : Text('${viewModel.mobileCarrier}'),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: () {
                      CMModalBottomSheet.show(context, selectPhoneCarriers());
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
        ],
      ),
    );
  }

  Widget selectPhoneCarriers() {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('통신사 선택', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {
                    /// TODO : modal sheet 내리기
                  },
                  child: Assets.images.icon.xButton.image(width: 14, height: 14),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          ListTile(
            title: Text('SKT', style: TextStyle(fontSize: 20, color: Color(0xFF9D9D9D))),
            contentPadding: EdgeInsets.zero,
            onTap: () {
              viewModel.inputMobileCarrier('SKT');
            },
          ),
          ListTile(
            title: Text('KT', style: TextStyle(fontSize: 20, color: Color(0xFF9D9D9D))),
            contentPadding: EdgeInsets.zero,
            onTap: () {
              viewModel.inputMobileCarrier('KT');
            },
          ),
          ListTile(
            title: Text('LG U+', style: TextStyle(fontSize: 20, color: Color(0xFF9D9D9D))),
            contentPadding: EdgeInsets.zero,
            onTap: () {
              viewModel.inputMobileCarrier('LG U+');
            },
          ),
          ListTile(
            title: Text('SKT 알뜰폰', style: TextStyle(fontSize: 20, color: Color(0xFF9D9D9D))),
            contentPadding: EdgeInsets.zero,
            onTap: () {
              viewModel.inputMobileCarrier('SKT 알뜰폰');
            },
          ),
          ListTile(
            title: Text('KT 알뜰폰', style: TextStyle(fontSize: 20, color: Color(0xFF9D9D9D))),
            contentPadding: EdgeInsets.zero,
            onTap: () {
              viewModel.inputMobileCarrier('KT 알뜰폰');
            },
          ),
          ListTile(
            title: Text('LG U+ 알뜰폰', style: TextStyle(fontSize: 20, color: Color(0xFF9D9D9D))),
            contentPadding: EdgeInsets.zero,
            onTap: () {
              viewModel.inputMobileCarrier('LG U+ 알뜰폰');
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget drawFooter() {
    if (viewModel.phoneNumber != null &&
        viewModel.phoneNumber!.length == 11 &&
        !viewModel.isPhoneNumberInput) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child:
              CMButton(
                text: "확인",
                onPressed: () {
                  viewModel.setPhoneNumber();
                },
              ).successButton(),
        ),
      );
    } else if (viewModel.mobileCarrier != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child:
              CMButton(
                backgroundColor:
                    viewModel.mobileCarrier == null ? Color(0xFF59FF9C) : Color(0xFF18CB60),
                text: "확인",
                onPressed: () {
                  viewModel.goSMSAuthenticationPage();
                },
              ).successButton(),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
