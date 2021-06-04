import 'package:flutter/material.dart';
import 'package:my_paradise/ui_constants.dart';

class NoUser extends StatefulWidget {
  _NoUser createState() => _NoUser();
}

class _NoUser extends State<NoUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    Text(
                      'No has iniciado sesión, debes iniciar sesion para las siguientes tareas:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    OutlinedButton(
                      onPressed: () async {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
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
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Text(
                          "Iniciar Sesión",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
