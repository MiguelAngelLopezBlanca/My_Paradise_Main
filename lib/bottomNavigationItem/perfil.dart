import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_paradise/editar_perfil.dart';
import 'package:my_paradise/ui_constants.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  void handleNavigateTapToEditarPerfil(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => EditarPerfil(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorSubtitulos2,
      body: Stack(
        children: [
          SafeArea(
              child: FractionallySizedBox(
            widthFactor: 1,
            child: Column(
              children: [
                InkWell(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 1.1),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => handleNavigateTapToEditarPerfil(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 45),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            color: Colors.black,
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/iconos/profile.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Nombre y Apellidos',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'email@example.com',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Telefono',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 300, 0, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(200),
                ),
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
