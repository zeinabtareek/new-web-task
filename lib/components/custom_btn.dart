import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';


class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.onPressed
  });
  final String text;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // primary: AppColors.whiteColor,
        primary:kSecondaryColor,
        onPrimary: AppColors.gradientLightBlueColor,
        side: BorderSide(width: 1, color: AppColors.gradientLightBlueColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
