import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/auth.dart';
import '../../main/main_screen.dart';

class LogInController extends GetxController{
  final services = AuthServices();
  final    isLoading =false.obs;

  final userName=''.obs;
  final pass=''.obs;
  login({required BuildContext context}) async {
  isLoading.value=true;
    UserCredential?
        result =
        await services.login(email:userName.value, password:pass.value, context: context);

    if (result?.user?.uid != null) {
      print('the user id ${result?.user!.uid}');
    } else {}
  isLoading.value=false;

  }


}