import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:my_paradise/ui_constants.dart';

import 'bottomNavigationItem/mas.dart';

class DetallesModelos extends StatelessWidget {
  final Modelo modelo;

  DetallesModelos(this.modelo);

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
  Widget build(BuildContext context) {
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
                            vertical: MediaQuery.of(context).size.width / 7),
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
                        onPressed: () => null,
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
                          margin: EdgeInsets.only(top: 10),
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
