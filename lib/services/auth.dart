import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../common/ui/overlay_helper.dart';
import '../helper/shared_prefrences.dart';
import '../screens/login/login_screen.dart';
import '../screens/main/main_screen.dart';
import '/../../../models/user_model.dart' as user;

class AuthServices {
  final auth = FirebaseAuth.instance;
  final cloud = FirebaseDatabase.instance;

  login({email, password,  required BuildContext context}) async {

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password) .then((value) async {
      // await auth.signInWithEmailAndPassword(email: 'zozo@gmail.com', password: '123456') .then((value) async {

        OverlayHelper.showSuccessToast(
            Get.overlayContext!, "LogIn successfully!");
      });
      await saveUser(email,password);
      Get.offAll(MainScreen());

    } on FirebaseAuthException catch (e) {
      print(e.message);

      OverlayHelper.showErrorToast(context, e.message.toString());
    }
   }


saveUser(name,pass)async{
  var users = await user.User(
      name: '$name',
       password: pass,
       id: auth.currentUser!.uid,
   );
  CacheHelper.loginShared = users;
  print('......'+'${CacheHelper.loginShared!.id}');
  CacheHelper.saveData(
      key:  "token",value:CacheHelper.loginShared!.id);


}
  logOut(context)async{
    try {
      await auth
          .signOut()
          .then((value) {
        CacheHelper.removeData(key: 'token');
        CacheHelper.clearData();
            OverlayHelper.showSuccessToast(
            Get.overlayContext!, "SignOut successfully!");
      });
      Get.offAll(LogInScreen());
    } on FirebaseAuthException catch (e) {
      OverlayHelper.showErrorToast(context, e.message.toString());
    }
  }

}
