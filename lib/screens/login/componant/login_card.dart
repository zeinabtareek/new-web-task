import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outlook/components/custom_btn.dart';
import 'package:outlook/screens/main/main_screen.dart';

import '../../../common/constants.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/header_widget.dart';
import '../controller/controller.dart';

class LoginCard extends StatelessWidget {
    LoginCard({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    final controller=Get.put(LogInController());

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          height: _size.height/2,
          width: _size.width/2,
          decoration: BoxDecoration(
            color:  kBgLightColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(
                  body:  '\ncontact the support for any issue ',
                  isActive:  true,
                  title: 'Login',
                  context:  context
              ),
              CustomTextField(isSearch: false, text: "User Name",
                onChanged: (String x) {
                controller.userName.value=x;

                },
              ),
              CustomTextField(isSearch: false, text: "Password",
                onChanged: (String x ) {
                  controller.pass.value=x;
                },),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Obx(()=> Expanded(child: CustomButton(text: controller.isLoading.value?'....':'Login', onPressed:() {controller.login(context: context);}))),
                 SizedBox(width: 20,),
                 Expanded(child: CustomButton(text: 'Skip\n(Guest)', onPressed:() {Get.off(MainScreen());})),


               ],
             ),



            ],
          ),
        ),
      ),
    );
  }
}
