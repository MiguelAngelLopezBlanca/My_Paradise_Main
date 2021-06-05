import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:my_paradise/bottomNavigationItem/ofertas.dart';
import 'package:my_paradise/ui_constants.dart';

class DetallesOfertas extends StatelessWidget {
  final Oferta ofertas;

  DetallesOfertas(this.ofertas);

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
          ofertas.nombre,
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
            height: returnResponsiveHeight(context, 0.4),
            child: Cube(
              onSceneCreated: (Scene scene) {
                scene.camera.zoom = 10;
                scene.world.add(
                  Object(fileName: 'assets/modelos/' + ofertas.nombreArchivo),
                );
              },
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            child: Container(
              height: returnResponsiveHeight(context, 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.business),
                                        Padding(
                                            padding: EdgeInsets.only(right: 5)),
                                        Text(
                                          'Constructora',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: returnResponsiveFontSize(
                                                context, 25),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              ofertas.nomConstructora,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: returnResponsiveFontSize(context, 18),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.phone),
                                        Padding(
                                            padding: EdgeInsets.only(right: 5)),
                                        Text(
                                          'Telefono',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: returnResponsiveFontSize(
                                                context, 25),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              ofertas.telefono,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: returnResponsiveFontSize(context, 18),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 12,
                                  top: 20),
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Text(
                                ofertas.descripcion,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      returnResponsiveFontSize(context, 18),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.monetization_on,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                Padding(padding: EdgeInsets.only(right: 15)),
                                Text(
                                  'PRECIO: ' + ofertas.precio + '€',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          returnResponsiveFontSize(context, 20),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
