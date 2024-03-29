import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_paradise/ui/bottomNavigationItem/mas.dart';
import 'package:my_paradise/ui/bottomNavigationItem/ofertas.dart';
import 'package:my_paradise/ui/bottomNavigationItem/perfil.dart';

import '../../ui_constants.dart';
import '../home_page.dart';
import '../no_user.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  FirebaseAuth auth = FirebaseAuth.instance;
  int _menuActual = 1;

  List<Widget> _paginas = [
    ListadoOfertas(),
    Mas(),
    Perfil(),
  ];

  void handleNavigateTapToHomePage(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }

  void handleNavigateTapToNoUser(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => NoUser(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_menuActual],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/iconos/descuento.png"),
              ),
              label: 'Ofertas',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/iconos/mas.png"),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/iconos/usuario.png"),
              ),
              label: 'Perfil',
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _menuActual,
          selectedItemColor: colorBotones,
          unselectedItemColor: Colors.black,
          iconSize: 25,
          onTap: (index) {
            setState(() {
              if (auth.currentUser != null) {
                _menuActual = index;
              } else {
                if (index == 2) {
                  print('No has iniciado sesion');
                  handleNavigateTapToNoUser(context);
                } else {
                  _menuActual = index;
                }
              }
            });
          },
          elevation: 0),
    );
  }
}
