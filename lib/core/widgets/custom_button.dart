import 'dart:ui';
import 'package:bookly_app/core/utils/font_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,  this.borderRadius, required this.backgroundColor, required this.textColor, required this.text,  this.fontSize, this.onPressed});
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final String text ;
  final double? fontSize;
  final  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(style:TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius:borderRadius??BorderRadius.circular(12) )
      ),
          onPressed: onPressed
          , child: Text(text,style: Styles.textStyle18.copyWith(color: textColor,fontSize: fontSize ),)),
    );
  }
}
 