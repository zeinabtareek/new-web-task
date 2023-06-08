import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:outlook/screens/login/login_screen.dart';
import 'package:outlook/screens/main/main_screen.dart';
import '../../../helper/shared_prefrences.dart';
import '../../main/controller/home_controller.dart';

class LoadingController extends GetxController {
  final homeController =Get.put(HomeController());


  late Timer timer;
  //we can use this func to get data before the app starts
  callDataWithPause60Seconde() {
    Future.doWhile(() async {
      await  CacheHelper.loginShared?.id!=null?Get.offAll(MainScreen()):Get.offAll(LogInScreen());

      timer = await Future.delayed(Duration(seconds: 3));
      return true;
    });
  }

  @override
  void dispose() {

    timer.cancel();
     super.dispose();
  }

  @override
  onInit()async{
    startTimer();

    // callDataWithPause60Seconde();
    super.onInit();
  }

  startTimer() {
    Timer(const Duration(seconds: 3), () async {
     var token= await CacheHelper.getData(key: 'token');
      await  token!=null?Get.offAll(MainScreen()):Get.offAll(LogInScreen());
     });
  }




}
