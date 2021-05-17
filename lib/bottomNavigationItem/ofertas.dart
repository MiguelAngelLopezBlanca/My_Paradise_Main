import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../detallesOfertas.dart';
import '../ui_constants.dart';

class Ofertas extends StatefulWidget {
  @override
  _Ofertas createState() => _Ofertas();
}

class _Ofertas extends State<Ofertas> {
  String titulo = 'Ofertas';

  double returnResponsiveWidth(context, double originalPercentValue) {
    return MediaQuery.of(context).size.width * originalPercentValue;
  }

  double returnResponsiveHeight(context, double originalPercentValue) {
    return MediaQuery.of(context).size.height * originalPercentValue;
  }

  void handleNavigateTapToDetallesOferta(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => DetallesOfertas(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: ListView(
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                          width: 100,
                          color: Colors.black.withAlpha(120),
                          alignment: Alignment.center,
                          child: Text(
                            'Modelo 1',
                            style: TextStyle(
                                color: subtitulo,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    onTap: () => handleNavigateTapToDetallesOferta(context),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        width: 100,
                        color: Colors.black.withAlpha(120),
                        alignment: Alignment.center,
                        child: Text(
                          'Modelo 1',
                          style: TextStyle(
                              color: subtitulo,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        width: 100,
                        color: Colors.black.withAlpha(120),
                        alignment: Alignment.center,
                        child: Text(
                          'Modelo 1',
                          style: TextStyle(
                              color: subtitulo,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        width: 100,
                        color: Colors.black.withAlpha(120),
                        alignment: Alignment.center,
                        child: Text(
                          'Modelo 1',
                          style: TextStyle(
                              color: subtitulo,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        width: 100,
                        color: Colors.black.withAlpha(120),
                        alignment: Alignment.center,
                        child: Text(
                          'Modelo 1',
                          style: TextStyle(
                              color: subtitulo,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        width: 100,
                        color: Colors.black.withAlpha(120),
                        alignment: Alignment.center,
                        child: Text(
                          'Modelo 1',
                          style: TextStyle(
                              color: subtitulo,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        width: 100,
                        color: Colors.black.withAlpha(120),
                        alignment: Alignment.center,
                        child: Text(
                          'Modelo 1',
                          style: TextStyle(
                              color: subtitulo,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
