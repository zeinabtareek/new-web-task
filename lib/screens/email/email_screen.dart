import 'package:flutter/material.dart';
import 'package:outlook/models/Email.dart';
import '../../components/customCard.dart';
import '../../common/constants.dart';
import '../main/components/email_card.dart';
import '../../components/header_widget.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({
    Key? key,
    this.email,
  }) : super(key: key);

  final Email? email;

  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, ),
        child: InkWell(
          onTap: (){},
          child: Stack(
              children: [
          Container(
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color:   kSecondaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderWidget(
                  body: 'is simply dummy text of ',
                  isActive: false,
                  title: 'What\'s due',
                  context: context),
               CustomCard(context),
               CustomCard(context),
            ],
          ),
        ),]
        ),
        ),

    );
  }
}
