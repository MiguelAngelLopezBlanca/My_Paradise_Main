import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../ui_constants.dart';

class Registro extends StatefulWidget {
  @override
  _Registro createState() => _Registro();
}

class _Registro extends State<Registro> {
  File imageFile;

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

  void abrirGaleria(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);

    this.setState(() {
      imageFile = picture;
    });
  }

  Widget verImagen() {
    if (imageFile != null) {
      return Image.file(imageFile,
          width: returnResponsiveWidth(context, 0.2),
          height: returnResponsiveHeight(context, 0.1));
    } else {
      return Text(
        "Por favor seleccione una imagen",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      );
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
              Padding(padding: const EdgeInsets.fromLTRB(0, 50, 0, 0)),
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
                  Column(
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.camera,
                          color: Colors.white,
                          size: 50,
                        ),
                        onTap: () => abrirGaleria(context),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              verImagen(),
              const SizedBox(
                height: 30,
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: new InputDecoration(
                        fillColor: fondoTextField,
                        filled: true,
                        hintText: "Apellido",
                        hintStyle: TextStyle(color: colorPrincipal),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                    OutlinedButton(
                      onPressed: () => null,
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
