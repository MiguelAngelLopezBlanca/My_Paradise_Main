import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:my_paradise/ui/bottomNavigation/menu.dart';
import 'package:my_paradise/ui/home_page.dart';

import 'calls_and_messages_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  Widget comprobarUsuario(BuildContext context) {
    if (auth.currentUser != null) {
      return Menu();
    } else {
      return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.blue),
      home: comprobarUsuario(context),
    );
  }
}
