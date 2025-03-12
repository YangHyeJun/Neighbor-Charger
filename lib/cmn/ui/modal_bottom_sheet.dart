import 'package:flutter/material.dart';

class CMModalBottomSheet extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  CMModalBottomSheet({required this.child, this.borderRadius = 20.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
              },
              child: Container(
                color: Colors.white,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return CMModalBottomSheet(child: child);
      },
    );
  }
}
