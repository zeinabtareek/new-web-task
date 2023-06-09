import 'package:flutter/material.dart';
import 'package:outlook/common/extensions.dart';
import '../common/constants.dart';

class CounterBadge extends StatelessWidget {
  const CounterBadge({
    Key ?key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
       decoration: BoxDecoration(
          color: kBadgeColor, borderRadius: BorderRadius.circular(9)),
      child: Text(
        count.toString(),
        style: Theme.of(context).textTheme.caption?.copyWith(
              fontWeight: FontWeight.w500,
              color: kBgLightColor
            ),
      ),
    ).addNeumorphism(
      offset: Offset(4, 4),
      borderRadius: 9,
      blurRadius: 4,
      topShadowColor: kBgLightColor,
      bottomShadowColor: Color(0xFF30384D).withOpacity(0.3),
    );
  }
}
