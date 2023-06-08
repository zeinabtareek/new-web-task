import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/constants.dart';
import 'custom_btn.dart';

CustomCard(context) {
  return SingleChildScrollView(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.timer,
            color: AppColors.gradientLightBlueColor,
          ),
          SizedBox(width: kDefaultPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'Unite 2 quiz\n',
                          style: Theme.of(context).textTheme.button,
                          children: [
                            TextSpan(
                                text: "<elvia.atkins@gmail.com> to Jerry Torp",
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: kDefaultPadding),
                LayoutBuilder(
                  builder: (context, constraints) => SizedBox(
                    width:
                        constraints.maxWidth > 850 ? 800 : constraints.maxWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " Sunt architecto voluptatum esse tempora sint nihil minus incidunt nisi. Perspiciatis natus quos cupiditate.\n",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        CustomButton(
                          text: 'start Quiz',
                          onPressed: () {},
                        ),
                        Divider(thickness: 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
}
