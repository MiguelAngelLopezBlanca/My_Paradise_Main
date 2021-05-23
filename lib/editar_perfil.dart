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
  String dsName, mail, passwd, passwdV;

  void abrirGaleria(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);

    this.setState(() {
      imageFile = picture;
    });
  }

  Widget verImagen() {
    if (imageFile != null) {
      return Image.file(imageFile,
          width: returnResponsiveWidth(context, 0.3),
          height: returnResponsiveHeight(context, 0.3));
    } else {
      return Text(
        "Por favor seleccione una imagen",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      );
    }
  }

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

  void updateData() {
    auth.currentUser
        .updateProfile(displayName: dsName, photoURL: imageFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorSubtitulos2,
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
                    OutlinedButton(
                      onPressed: () => abrirGaleria(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        backgroundColor: colorSubtitulos1,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      child: const Text(
                        "Subir imagen",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    verImagen(),
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
                      height: 20,
                    ),
                    TextField(
                      decoration: new InputDecoration(
                        fillColor: fondoTextField,
                        filled: true,
                        hintText: "Email",
                        hintStyle: TextStyle(color: colorPrincipal),
                        suffixIcon: const Icon(
                          Icons.email,
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: new InputDecoration(
                        fillColor: fondoTextField,
                        filled: true,
                        hintText: "Telefono",
                        hintStyle: TextStyle(color: colorPrincipal),
                        suffixIcon: const Icon(
                          Icons.phone,
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
                    ),
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
