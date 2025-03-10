import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CMButton {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Image? image;
  final VoidCallback onPressed;

  CMButton({
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.image,
    required this.onPressed,
  });

  Widget buildButton({
    required String text,
    required Color bgColor,
    required Color textColor,
    required Color borderColor,
    required VoidCallback onPressed,
    Image? image,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 350,
        height: 58,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child:
            image == null
                ? Center(
                  child: Text(
                    text,
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image,
                    Text(
                      text,
                      style: TextStyle(color: textColor, fontSize: 16),
                    ),
                  ],
                ),
      ),
    );
  }

  Widget successButton() {
    return buildButton(
      text: text,
      bgColor: backgroundColor ?? const Color(0xFF18CB60),
      textColor: textColor ?? Colors.white,
      onPressed: onPressed,
      borderColor: borderColor ?? Colors.transparent,
    );
  }

  Widget commonButton() {
    return buildButton(
      text: text,
      bgColor: backgroundColor ?? Colors.transparent,
      textColor: textColor ?? Colors.black,
      onPressed: onPressed,
      borderColor: borderColor ?? Colors.black,
      image: image,
    );
  }
}
