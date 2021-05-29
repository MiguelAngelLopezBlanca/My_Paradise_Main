import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui_constants.dart';

class Mas extends StatefulWidget {
  @override
  _Mas createState() => _Mas();
}

class _Mas extends State<Mas> {
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Modelo> _modelos = [];

  double returnResponsiveWidth(context, double originalPercentValue) {
    return MediaQuery.of(context).size.width * originalPercentValue;
  }

  @override
  void initState() {
    super.initState();
    getModels();
  }

  void getModels() async {
    FirebaseFirestore.instance.collection('modelos').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            String name = doc["nombre"];
            String descripcion = doc["descripcion"];
            String nombreArchivo = doc["nombreArchivo"];
            String nombreImagen = doc["nombreImagen"];
            Modelo modelo =
                new Modelo(name, descripcion, nombreArchivo, nombreImagen);
            _modelos.add(modelo);
          },
        );
        print(_modelos.length);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _modelos.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(10, 50, 10, 10),
            width: returnResponsiveWidth(context, 0.95),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/modelos/" + _modelos[index].nombreImagen),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.black.withAlpha(120),
              ),
              alignment: Alignment.center,
              child: Text(
                _modelos[index].nombre,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Modelo {
  String nombre;
  String descripcion;
  String nombreArchivo;
  String nombreImagen;

  Modelo(String name, String descripcion, String nombreArchivo,
      String nombreImagen) {
    this.nombre = name;
    this.descripcion = descripcion;
    this.nombreArchivo = nombreArchivo;
    this.nombreImagen = nombreImagen;
  }
}
