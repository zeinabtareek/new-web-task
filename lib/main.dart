import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:outlook/screens/loading_screen/load_screen.dart';
import 'package:outlook/screens/login/login_screen.dart';

import 'package:outlook/screens/main/main_screen.dart';

import 'helper/shared_prefrences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      appId: '1:556022861888:web:2a2adf0fe22a3adaf54fa5',
      apiKey: 'AIzaSyAnYYOBN8MRx8qFlVmI4q_Dsp3fxfhv62Q',
      projectId: 'fluttertaskweb',
      messagingSenderId: '556022861888',
     ),
  );  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: LoadingScreen(),
      // home: LogInScreen(),
      // home: MainScreen(),
    );
  }
}
