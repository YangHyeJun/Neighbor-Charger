import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neighbor_chargers/ui/sign_in/carInfo_viewmodel.dart';

import '../../cmn/ui/button.dart';
import '../../cmn/view/nc_view.dart';
import '../../evCar/charging_type.dart';

class CarInfoView extends NCView<CarInfoViewModel> {
  TextEditingController kind_of_car_controller = TextEditingController();

  @override
  Widget draw() {
    return Scaffold(body: SafeArea(child: Stack(children: <Widget>[_draw()])));
  }

  Widget _draw() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Expanded(child: body()), drawFooter()],
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 36, top: 50, right: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${viewModel.name}님,',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                  TextSpan(
                    text: '\n소유중인',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '전기차 정보',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF23B05C),
                    ),
                  ),
                  TextSpan(
                    text: '를\n입력해주세요.',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // 차종
            Padding(
              padding: const EdgeInsets.only(top: 44),
              child: Text("차종", style: TextStyle(fontSize: 18, color: Color(0xFF9D9D9D))),
            ),
            TextField(
              maxLength: 4,
              controller: kind_of_car_controller,
              decoration: InputDecoration(
                counterText: '',
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              onChanged: (value) {
                viewModel.setCarName(value);
              },
            ),

            // 충전 타입
            Padding(
              padding: const EdgeInsets.only(top: 64),
              child: Text("충전 타입", style: TextStyle(fontSize: 18, color: Color(0xFF9D9D9D))),
            ),
            drawChargingTypeBox(viewModel.chargingTypes),
          ],
        ),
      ),
    );
  }

  Widget drawChargingTypeBox(List<ChargingType> chargingTypes) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children:
            chargingTypes.map((chargingType) {
              bool isSelected = false;
              return ElevatedButton(
                onPressed: () {
                  isSelected = viewModel.isChargingTypeSelected(chargingType);
                  viewModel.setSelectedChargingType(chargingType, !isSelected!);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Color(0xFFEEEEEE), width: 1),
                  ),
                  elevation: 0,
                  backgroundColor:
                      viewModel.selectedChargingTypes?.contains(chargingType) == true
                          ? Color(0xFF23B05C)
                          : Colors.transparent,
                ),
                child: IntrinsicWidth(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      chargingType.name.toString().split('.').last,
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            viewModel.selectedChargingTypes?.contains(chargingType) == true
                                ? Colors.white
                                : Color(0xFF515151),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
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
                viewModel.goAccountPage();
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
              isDeactivate: viewModel.carName == null || viewModel.carName == '' ? true : false,
              onPressed: () {
                viewModel.goAccountPage();
              },
            ).successButton(),
          ],
        ),
      ),
    );
  }
}
