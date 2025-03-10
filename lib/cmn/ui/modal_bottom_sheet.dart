import 'package:flutter/material.dart';
import 'package:neighbor_chargers/cmn/manager/navigator.dart';

class CMModalBottomSheet extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  CMModalBottomSheet({required this.child, this.borderRadius = 20.0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            navigatorKey.currentState?.pop();
          },
          child: Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: child,
            ),
          ),
        ),
      ],
    );
  }

  static void show(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return CMModalBottomSheet(child: child);
      },
    );
  }
}
