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

  double returnResponsiveFontSize(context, double originalValue) {
    return (MediaQuery.of(context).size.width * originalValue) /
        masterScreenWidth;
  }

  @override
  void initState() {
    super.initState();
    getOfertas();
  }

  void getOfertas() async {
    await FirebaseFirestore.instance.collection('ofertas').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            String name = doc["nombre"];
            String descripcion = doc["descripcion"];
            String nombreArchivo = doc["nombreArchivo"];
            String nomConstructora = doc["nomConstructora"];
            String nombreImagen = doc["nombreImagen"];
            String precio = doc["precio"];
            String telefono = doc["telfEmpresa"];
            Oferta oferta = new Oferta(name, descripcion, nombreArchivo,
                nomConstructora, precio, nombreImagen, telefono);
            _ofertas.add(oferta);
          },
        );
        print(_ofertas.length);
      },
    );
    setState(() {});
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 30),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: primaryColor.withOpacity(0.8),
                          image: DecorationImage(
                            image: AssetImage('assets/images/modelos/' +
                                _ofertas[index].nombreImagen),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues(-20, 0, 0),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor.withOpacity(0.8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                    ),
                                    Text(
                                      _ofertas[index].nombre,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: returnResponsiveFontSize(
                                            context, 20),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Constructora: ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: returnResponsiveFontSize(
                                                context, 18),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          child: Text(
                                            _ofertas[index].nomConstructora,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  returnResponsiveFontSize(
                                                      context, 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text(
                                            'PRECIO: ' +
                                                _ofertas[index].precio +
                                                '€',
                                            style:
                                                TextStyle(color: colorTextos),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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
  String nombreImagen;
  String precio;
  String telefono;

  Oferta(
      String nombre,
      String descripcion,
      String nombreArchivo,
      String nomConstructora,
      String precio,
      String nombreImagen,
      String telefono) {
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.nombreArchivo = nombreArchivo;
    this.nomConstructora = nomConstructora;
    this.precio = precio;
    this.nombreImagen = nombreImagen;
    this.telefono = telefono;
  }
}
