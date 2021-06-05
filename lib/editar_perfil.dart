import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_paradise/ui_constants.dart';

class EditarPerfil extends StatefulWidget {
  _EditarPerfil createState() => _EditarPerfil();
}

class _EditarPerfil extends State<EditarPerfil> {
  File imageFile;
  FirebaseAuth auth = FirebaseAuth.instance;
  String dsName, passwd, passwdV;

  double returnResponsiveWidth(context, double originalPercentValue) {
    return MediaQuery.of(context).size.width * originalPercentValue;
  }

  double returnResponsiveHeight(context, double originalPercentValue) {
    return MediaQuery.of(context).size.height * originalPercentValue;
  }

  double returnResponsiveFontSize(context, double originalValue) {
    return (MediaQuery.of(context).size.width * originalValue) /
        masterScreenWidth;
  }

  void updateData() async {
    if (dsName != null && dsName.isNotEmpty) {
      await auth.currentUser.updateProfile(displayName: dsName);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Datos de usuario actualizados"),
      ));
    }
    if (passwd != null && passwd.isNotEmpty && passwd == passwdV) {
      auth.currentUser.updatePassword(passwd);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Datos de usuario actualizados"),
      ));
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorSubtitulos2,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          auth.currentUser.displayName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(0, 50, 0, 0)),
              Text(
                'Editar Perfil',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: returnResponsiveFontSize(context, 30)),
              ),
              FractionallySizedBox(
                widthFactor: 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
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
                        hintText: "Nombre y Apellidos",
                        hintStyle: TextStyle(color: colorPrincipal),
                        suffixIcon: const Icon(
                          Icons.person,
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
                        dsName = value;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Cambiar contraseña',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: returnResponsiveFontSize(context, 15)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
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
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
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
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                    OutlinedButton(
                      onPressed: () => updateData(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        backgroundColor: colorSubtitulos1,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      child: const Text(
                        "Guardar",
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
