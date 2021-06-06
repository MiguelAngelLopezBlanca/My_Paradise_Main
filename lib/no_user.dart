import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_paradise/bottomNavigationItem/registro.dart';
import 'package:my_paradise/ui_constants.dart';

import 'home_page.dart';

class NoUser extends StatefulWidget {
  _NoUser createState() => _NoUser();
}

void handleNavigateTapToHome(BuildContext context) {
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (_) => HomePage(),
    ),
  );
}

void handleNavigateTapToRegistro(BuildContext context) {
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (_) => Registro(),
    ),
  );
}

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

class _NoUser extends State<NoUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fondo_noUser.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SafeArea(
              child: FractionallySizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 1,
                          top: MediaQuery.of(context).size.height / 20),
                    ),
                    Container(
                      width: returnResponsiveWidth(context, 1),
                      child: Text(
                        'Consigue la Casa Perfecta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: returnResponsiveFontSize(context, 35),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: returnResponsiveWidth(context, 1),
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'Descubre miles de casas y diseños.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: returnResponsiveFontSize(context, 20),
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: returnResponsiveWidth(context, 1),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                              ),
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: returnResponsiveWidth(context, 0.8),
                                child: Text(
                                  'Busca y descubre diseños que te enamorarán',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          returnResponsiveFontSize(context, 18),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                              ),
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: returnResponsiveWidth(context, 0.8),
                                child: Text(
                                  'Disfruta de ofertas exclusivas',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          returnResponsiveFontSize(context, 18),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                              ),
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: returnResponsiveWidth(context, 0.8),
                                child: Text(
                                  'Pide tus presupuestos y contacta directamente con las constructoras',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          returnResponsiveFontSize(context, 18),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: returnResponsiveWidth(context, 0.8),
                                height: returnResponsiveHeight(context, 0.2),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/iconos/logo.png'),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        handleNavigateTapToRegistro(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                        backgroundColor: colorBotones,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(40),
                            right: Radius.circular(
                              40,
                            ),
                          ),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          "REGISTRATE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.linear_scale,
                              color: Colors.white,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '¿Ya tienes cuenta?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      returnResponsiveFontSize(context, 14)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.linear_scale,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        handleNavigateTapToHome(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                        backgroundColor: colorBotones,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(40),
                            right: Radius.circular(
                              40,
                            ),
                          ),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          "INICIAR SESIÓN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
