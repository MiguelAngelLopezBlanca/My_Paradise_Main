import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_paradise/bottomNavigationItem/mas.dart';

import 'bottomNavigation/menu.dart';
import 'home_page.dart';

void main() {
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
