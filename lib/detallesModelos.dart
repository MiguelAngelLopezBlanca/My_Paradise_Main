import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:my_paradise/no_user.dart';
import 'package:my_paradise/ui_constants.dart';

import 'bottomNavigationItem/mas.dart';
import 'listado_presupuestos.dart';

class DetallesModelos extends StatelessWidget {
  final Modelo modelo;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<Presupuesto> _presupuestos = [];

  DetallesModelos(this.modelo);

  void handleNavigateTapToMas(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => Mas(),
      ),
    );
  }

  void handleNavigateTapNoUser(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => NoUser(),
      ),
    );
  }

  void getPresupuestos() async {
    await FirebaseFirestore.instance.collection('presupuestos').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            String name = doc["nombreModelo"];
            String email = doc["emailUsuario"];
            Presupuesto presupuesto = new Presupuesto(name, email);
            if (presupuesto.emailUsuario == auth.currentUser.email) {
              _presupuestos.add(presupuesto);
            }
          },
        );
        print(_presupuestos.length);
      },
    );
  }

  bool comprobarModelo(String nombre) {
    for (int i = 0; i < _presupuestos.length; i++) {
      if (_presupuestos[i].nombreModelo == nombre) {
        return true;
      }
    }

    return false;
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

  bool insertarPresupuesto() {
    String email = auth.currentUser.email;
    String model = modelo.nombre;

    bool done = false;

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("presupuestos");

    collectionReference
        .doc()
        .set({'emailUsuario': email, 'nombreModelo': model});

    done = true;

    return done;
  }

  @override
  Widget build(BuildContext context) {
    getPresupuestos();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          modelo.nombre,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: returnResponsiveWidth(context, 1),
            height: returnResponsiveHeight(context, 0.6),
            child: Cube(
              onSceneCreated: (Scene scene) {
                scene.camera.zoom = 8;
                scene.world.add(
                  Object(fileName: 'assets/modelos/' + modelo.nombreArchivo),
                );
              },
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            child: Container(
              width: returnResponsiveWidth(context, 1),
              height: returnResponsiveHeight(context, 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: MediaQuery.of(context).size.width / 15),
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Text(
                          modelo.descripcion,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.black,
                            fontSize: returnResponsiveFontSize(context, 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          if (auth.currentUser != null) {
                            if (comprobarModelo(modelo.nombre) == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    "Ya has solicitado presupuesto para este proyecto"),
                              ));
                            } else {
                              insertarPresupuesto();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Presupuesto solicitado"),
                              ));
                              Navigator.pop(context);
                            }
                          } else {
                            handleNavigateTapNoUser(context);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: colorBotones,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30),
                              right: Radius.circular(
                                30,
                              ),
                            ),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          height: 30,
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            "Solicitar Presupuesto",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
