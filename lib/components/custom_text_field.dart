import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../common/constants.dart';

class CustomTextField extends StatelessWidget {
  final bool isSearch;
  final String text;
  Function(String)? onChanged;
    CustomTextField({
    super.key,
    required this.isSearch,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged ,
      decoration: InputDecoration(
        hintText: text,
        fillColor:  isSearch?kBgLightColor:AppColors.whiteColor,
        filled: true,
        suffixIcon: isSearch?Padding(
          padding: const EdgeInsets.all(
              kDefaultPadding * 0.75), //15
          child: WebsafeSvg.asset(
            "assets/Icons/Search.svg",
            width: 24,
          ),
        ):null,
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
