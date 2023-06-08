import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outlook/screens/login/login_screen.dart';
import '../common/constants.dart';
import '../screens/main/controller/home_controller.dart';
import 'side_menu_item.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatelessWidget {
List ?listOfItems;

  SideMenu({
   required this.listOfItems,
     Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return  Container(
        height: double.infinity,
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
         decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(topEnd: Radius.circular(0)),
          // color: AppColors.gradientLightBlueColor,
          image: DecorationImage(
              fit: BoxFit.cover, opacity: 200, image: AssetImage('')),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.gradientDarkBlueColor ,
                AppColors.appBarColor2 ,
                AppColors.gradientLightBlueColor.withAlpha(210),
              ],
            ),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.0005),
              spreadRadius: 0,
              blurRadius: 40,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
               children: [
                 controller.services.auth.currentUser!=null?  Text(
                   "${controller.services.auth.currentUser!.email}",
                   style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,overflow: TextOverflow.ellipsis,color: AppColors.whiteColor),
                  ):Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       "WELCOME",
                       style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,overflow: TextOverflow.ellipsis,color: AppColors.whiteColor),
                 ),
                      IconButton(
                          onPressed: () {
                            Get.off(LogInScreen());
                          },
                          icon: Icon(Icons.login,color: AppColors.whiteColor,size: 30,))
                    ],
                  ),


                 //List Of Items
                ...List.generate(
                  listOfItems!.length,
                  (index) =>
                   Obx(()=>   SideMenuItem(
                       press: () {
                         controller.active();
                       },
                       title: listOfItems![index]['name'],
                       iconSrc: listOfItems![index]['icon'],
                       // isActive: index == listOfItems!.length - 1 ? truetrue : false,
                       isActive: controller.pressed.value,
                       itemCount: index == listOfItems!.length - 1 ? 3 : null,

                  ),
                  ),
                ),
              ],
            ),
          ),

      ),
    );
  }
}
