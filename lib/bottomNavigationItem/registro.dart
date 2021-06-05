import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_paradise/home_page.dart';

import '../ui_constants.dart';

class Registro extends StatefulWidget {
  @override
  _Registro createState() => _Registro();
}

class _Registro extends State<Registro> {
  void handleNavigateTapToHome(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }

  double returnResponsiveFontSize(context, double originalValue) {
    return (MediaQuery.of(context).size.width * originalValue) /
        masterScreenWidth;
  }

  double returnResponsiveWidth(context, double originalPercentValue) {
    return MediaQuery.of(context).size.width * originalPercentValue;
  }

  double returnResponsiveHeight(context, double originalPercentValue) {
    return MediaQuery.of(context).size.height * originalPercentValue;
  }

  String dsName, mail, passwd, passwdV;

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(
      String name, String password, String email) async {
    try {
      if (name == null || name.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Por favor, inserte un nombre válido"),
        ));
      } else if (email == null || !isEmail(email)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("El email no es válido"),
        ));
      } else if (passwd == null || passwd.isEmpty || passwd != passwdV) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Las contraseñas deben coincidir"),
        ));
      } else if (passwd.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("La contraseña debe tener 6 caracteres mínimo"),
        ));
      } else {
        UserCredential result = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        User user = result.user;
        user.updateProfile(displayName: name); //added this line
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Usuario creado correctamente")));
        handleNavigateTapToHome(context);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(0, 60, 0, 0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Registrarme',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: returnResponsiveFontSize(context, 30)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FractionallySizedBox(
                widthFactor: 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                        decoration: new InputDecoration(
                          fillColor: fondoTextField,
                          filled: true,
                          hintText: "Nombre",
                          hintStyle: TextStyle(color: colorPrincipal),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          dsName = value;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                        decoration: new InputDecoration(
                          fillColor: fondoTextField,
                          filled: true,
                          hintText: "Email",
                          hintStyle: TextStyle(color: colorPrincipal),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          mail = value;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                        decoration: new InputDecoration(
                          fillColor: fondoTextField,
                          filled: true,
                          hintText: "Contraseña",
                          hintStyle: TextStyle(color: colorPrincipal),
                          suffixIcon: const Icon(
                            Icons.remove_red_eye_rounded,
                            color: colorPrincipal,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          passwd = value;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                        decoration: new InputDecoration(
                          fillColor: fondoTextField,
                          filled: true,
                          hintText: "Confirmar Contraseña",
                          hintStyle: TextStyle(color: colorPrincipal),
                          suffixIcon: const Icon(
                            Icons.remove_red_eye_rounded,
                            color: colorPrincipal,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          passwdV = value;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                    OutlinedButton(
                      onPressed: () =>
                          {registerWithEmailAndPassword(dsName, passwd, mail)},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        backgroundColor: colorBotones,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      child: const Text(
                        "Registrarme",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
