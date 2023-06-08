
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../responsive.dart';
import 'componant/login_card.dart';
import 'controller/controller.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LogInController());

    final _size=MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: LoginCard(

        ),
        tablet: Wrap(
          children: [
            Container(
              height: _size.height,
              child: LoginCard(   ),

            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 1 : 4,
              child:LoginCard(  ),

            ),

          ],
        ),
      ),
    );

  }
}
