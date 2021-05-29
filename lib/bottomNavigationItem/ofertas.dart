import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../detallesOfertas.dart';
import '../ui_constants.dart';

class ListadoOfertas extends StatefulWidget {
  @override
  _ListadoOfertas createState() => _ListadoOfertas();
}

class _ListadoOfertas extends State<ListadoOfertas> {
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Oferta> _ofertas = [];

  String titulo = 'Ofertas';

  double returnResponsiveWidth(context, double originalPercentValue) {
    return MediaQuery.of(context).size.width * originalPercentValue;
  }

  double returnResponsiveHeight(context, double originalPercentValue) {
    return MediaQuery.of(context).size.height * originalPercentValue;
  }

  @override
  void initState() {
    super.initState();
    getOfertas();
  }

  void getOfertas() async {
    FirebaseFirestore.instance.collection('ofertas').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            String name = doc["nombre"];
            String descripcion = doc["descripcion"];
            String nombreArchivo = doc["nombreArchivo"];
            String nomConstructora = doc["nomConstructora"];
            String precio = doc["precio"];
            Oferta oferta = new Oferta(
                name, descripcion, nombreArchivo, nomConstructora, precio);
            _ofertas.add(oferta);
          },
        );
        print(_ofertas.length);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _ofertas.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              height: returnResponsiveWidth(context, 0.3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage("assets/images/house.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.black.withAlpha(120),
                  alignment: Alignment.center,
                  child: Text(
                    _ofertas[index].nombre,
                    style: TextStyle(
                        color: colorSubtitulos1,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetallesOfertas(_ofertas[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Oferta {
  String nombre;
  String descripcion;
  String nombreArchivo;
  String nomConstructora;
  String precio;

  Oferta(String nombre, String descripcion, String nombreArchivo,
      String nomConstructora, String precio) {
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.nombreArchivo = nombreArchivo;
    this.nomConstructora = nomConstructora;
    this.precio = precio;
  }
}
