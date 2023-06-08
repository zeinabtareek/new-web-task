import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../common/constants.dart';
import 'counter_badge.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key? key,
    required this.isActive,
    this.isHover = false,
      this.itemCount,
    this.showBorder = true,
     required this.iconSrc,
     required this.title,
     required this.press,
  }) : super(key: key);

  final bool isActive, isHover, showBorder;
  final int ?itemCount;
  final String iconSrc, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            (isActive || isHover)
                ? WebsafeSvg.asset(
                    "assets/Icons/Angle right.svg",
                    width: 15,
                  )
                : SizedBox(width: 15),
            SizedBox(width: kDefaultPadding / 4),
           Container(
                padding: EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WebsafeSvg.asset(
                      iconSrc,
                      height: 20,
                  color:
                  isActive ||isHover?  kSecondaryColor: kBgDarkColor,),
                    SizedBox(width: kDefaultPadding * 0.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color:
                                (isActive || isHover) ? kBgLightColor : kBgLightColor,
                          ),
                    ),
                    // Spacer(),
                    SizedBox(width: 10,),
                    if (itemCount != null) CounterBadge(count: itemCount!)
                  ],
                ),
              ),

          ],
        ),
      ),
    );
  }
}
