import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';

HeaderWidget({isActive, title, context,body}){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: kBlackColor,
            ),
          ),
          Text(
            body,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: !isActive ? Colors.white : kTextColor,
            ),
          ),
        ],
      ),

      !isActive?  Text(
        'All',
        style: Theme.of(context).textTheme.caption?.copyWith(
            color: AppColors.greenColor ,
            fontWeight: FontWeight.bold
        ),
      ):SizedBox()


    ],
  );
}