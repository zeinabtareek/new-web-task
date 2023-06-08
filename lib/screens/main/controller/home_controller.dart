import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:outlook/screens/login/login_screen.dart';

import '../../../services/auth.dart';
import '../main_screen.dart';

class HomeController extends GetxController{
final pressed=false.obs;
final services = AuthServices();
  active(){
    pressed.value=!pressed.value;
  }
logOut(context) async {
  var result =
  await services.logOut(context);

  Get.back();
  if (result) {

    print("LogOut successfully!!");
  }
}

  List listOfItems=[
    {'name': 'Dashboard','icon':"assets/Icons/Inbox.svg"},
    {'name': 'Schedule','icon':"assets/Icons/Paperclip.svg"},
    {'name': 'Courses','icon':"assets/Icons/File.svg"},
    {'name': 'Guidebook','icon':"assets/Icons/Inbox.svg"},
    {'name': 'Performance','icon':"assets/Icons/Markup filled.svg"},
    {'name': 'Announcement','icon':"assets/Icons/Send.svg"},
  ];

}