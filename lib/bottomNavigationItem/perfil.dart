import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_paradise/editar_perfil.dart';
import 'package:my_paradise/home_page.dart';
import 'package:my_paradise/listado_presupuestos.dart';
import 'package:my_paradise/ui_constants.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  FirebaseAuth auth = FirebaseAuth.instance;
  int touchedIndex = -1;

  void handleNavigateTapToEditarPerfil(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => EditarPerfil(),
      ),
    );
  }

  void handleNavigateTapToListadoPresupuestos(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => ListadoPresupuestos(),
      ),
    );
  }

  void handleNavigateTapToCerrarSesion(BuildContext context) {
    auth.signOut();
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }

  double returnResponsiveWidth(context, double originalPercentValue) {
    return MediaQuery.of(context).size.width * originalPercentValue;
  }

  double returnResponsiveHeight(context, double originalPercentValue) {
    return MediaQuery.of(context).size.height * originalPercentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fourthColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 310, top: 50),
                child: InkWell(
                  child: Icon(
                    Icons.exit_to_app,
                    size: 50,
                  ),
                  onTap: () => handleNavigateTapToCerrarSesion(context),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 220,
                height: 420,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 70)),
                            Text(
                              auth.currentUser.displayName,
                              style: TextStyle(
                                color: colorTextos,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 30)),
                            Text(
                              auth.currentUser.email,
                              style: TextStyle(
                                color: colorTextos,
                                fontSize: 18,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 30)),
                            Text(
                              auth.currentUser.phoneNumber.toString(),
                              style: TextStyle(
                                color: colorTextos,
                                fontSize: 16,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 30)),
                            Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  width: 10,
                                  color: secundarColor,
                                ),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage("assets/contacto.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 53,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/lista_proyectos.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () =>
                            handleNavigateTapToListadoPresupuestos(context),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Column(
                    children: [
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/editar_perfil.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () => handleNavigateTapToEditarPerfil(context),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
