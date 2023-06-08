import 'package:flutter/material.dart';
import 'package:outlook/common/extensions.dart';
import 'package:outlook/models/Email.dart';
import '../../../common/constants.dart';
import '../../../components/header_widget.dart';

class EmailCard extends StatelessWidget {
  const EmailCard({
    Key? key,
    this.isActive = true,
     required this.press,
    required this.list,
  }) : super(key: key);

  final bool isActive;
   final List<Email> list;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    //  Here the shadow is not showing properly
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: isActive ? kSecondaryColor : kSecondaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 HeaderWidget(
                   body:  'is simply dummy text of the printing and typesetting industry',
                   isActive:  isActive,
                   title: 'Announcements',
                   context:  context
                 ),
                  SizedBox(width: kDefaultPadding / 2),

                  ///,,,,
                  ...List.generate(
                    list.length,
                    (index) => Container(
                      padding:     EdgeInsets.symmetric(vertical: kDefaultPadding / 2,),

                      child: Row(
                        children: [
                          SizedBox(
                            width: 32,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(list[index].image??''),
                            ),
                          ),
                          SizedBox(width: kDefaultPadding / 2),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: "${list[index].name} \n",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: isActive ? Colors.white : kTextColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: list[index].subject,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          color: isActive
                                              ?kBgLightColor
                                              : kGrayColor,
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                              Expanded(
                                flex: 2,
                                // width: 200,
                                child: Text(
                                  list[index].body??'',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.caption?.copyWith(
                                    height: 1.5,
                                    color: isActive ? kSecondaryColor : null,
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: Offset(5, 5),
              topShadowColor: kSecondaryColor,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
            ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: Offset(2, 2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
