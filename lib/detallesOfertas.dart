import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class DetallesOfertas extends StatefulWidget {
  @override
  _DetallesOfertasState createState() => _DetallesOfertasState();
}

class _DetallesOfertasState extends State<DetallesOfertas> {
  double returnResponsiveWidth(context, double originalPercentValue) {
    return MediaQuery.of(context).size.width * originalPercentValue;
  }

  double returnResponsiveHeight(context, double originalPercentValue) {
    return MediaQuery.of(context).size.height * originalPercentValue;
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
          'Detalles Ofertas',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Container(
              width: returnResponsiveWidth(context, 0.95),
              height: returnResponsiveHeight(context, 0.4),
              child: Cube(
                onSceneCreated: (Scene scene) {
                  scene.camera.zoom = 10;
                  scene.world.add(
                    Object(fileName: 'assets/modelos/modelo1/chalet.obj'),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 240, 0, 0),
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
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      margin:
                          EdgeInsets.symmetric(horizontal: 140, vertical: 20),
                      child: Text(
                        'Titulo Casa',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
