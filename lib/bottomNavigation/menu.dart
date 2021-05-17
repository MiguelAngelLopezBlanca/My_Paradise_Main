import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_paradise/bottomNavigationItem/mas.dart';
import 'package:my_paradise/bottomNavigationItem/ofertas.dart';
import 'package:my_paradise/bottomNavigationItem/perfil.dart';

import '../ui_constants.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _menuActual = 0;

  List<Widget> _paginas = [
    Ofertas(),
    Mas(),
    Perfil(),
  ];

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
              _menuActual = index;
            });
          },
          elevation: 0),
    );
  }
}
