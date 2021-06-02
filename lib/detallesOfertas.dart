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
            child: Column(
              children: [
                Column(
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
                              Object(
                                  fileName: 'assets/modelos/' +
                                      ofertas.nombreArchivo),
                            );
                          },
                        ),
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
                                color: Colors.white,
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
                                color: Colors.white,
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
                                  color: Colors.white,
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
                                  color: Colors.white,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            OutlinedButton(
                              onPressed: () async {},
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
                                  "Solicitar Oferta",
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
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
