import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_paradise/ui_constants.dart';

import 'bottomNavigation/menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final kHintTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'OpenSans',
  );

  void handleNavigateTapToMenu(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => Menu(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: FractionallySizedBox(
                widthFactor: 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '¡Bienvenido!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: returnResponsiveFontSize(context, 40.0)),
                    ),
                    Text(
                      'Inicia sesión para continuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: colorSubtitulos2,
                          fontSize: returnResponsiveFontSize(context, 20.0)),
                    ),
                    Image.asset(
                      'assets/images/iconos/logo.png',
                      height: 220,
                      width: 450, // v1.0.9+4 Antes: 30
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      // v2.1.21+7
                      keyboardType: TextInputType.emailAddress,
                      controller: userTextController,
                      style: TextStyle(
                        height: 1,
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      //
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        hintText: "Email", // v2.1.21+7
                        hintStyle: kHintTextStyle, // v2.1.21+7
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordTextController,
                      obscureText: true,
                      style: TextStyle(
                        height: 1,
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white, filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        hintText: "Contraseña",
                        hintStyle: kHintTextStyle, // v2.1.21+7
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OutlinedButton(
                    onPressed: () => null,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: colorBotones,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(0),
                          right: Radius.circular(
                            40,
                          ),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Iniciar Sesión",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OutlinedButton(
                    onPressed: () => handleNavigateTapToMenu(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: colorBotones,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(40),
                          right: Radius.circular(
                            0,
                          ),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Acceder como invitado",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿No tienes cuenta?  ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: gris,
                          fontSize: 17),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: GestureDetector(
                        // v2.1.22+7
                        onTap: () => null, //Registrarse
                        child: Text(
                          'Registrate',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: colorSubtitulos2,
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
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
      ),
    );
  }
}
