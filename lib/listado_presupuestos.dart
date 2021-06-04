import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import 'bottomNavigationItem/mas.dart';

class ListadoPresupuestos extends StatefulWidget {
  _ListadoPresupuestos createState() => _ListadoPresupuestos();
}

class _ListadoPresupuestos extends State<ListadoPresupuestos> {
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Presupuesto> _presupuestos = [];
  List<Modelo> _modelos = [];

  @override
  void initState() {
    super.initState();
    getPresupuestos();
    getModels();
  }

  void getPresupuestos() async {
    await FirebaseFirestore.instance.collection('presupuestos').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            String name = doc["nombreModelo"];
            String email = doc["emailUsuario"];
            Presupuesto presupuesto = new Presupuesto(name, email);
            if (presupuesto.emailUsuario == auth.currentUser.email) {
              _presupuestos.add(presupuesto);
            }
          },
        );
        print(_presupuestos.length);
      },
    );
    setState(() {});
  }

  String getImageModel(String nombreModelo) {
    for (var item in _modelos) {
      if (item.nombre == nombreModelo) {
        return item.nombreImagen;
      }
    }
  }

  String getDescriptionModel(String descripcionModelo) {
    for (var item in _modelos) {
      if (item.nombre == descripcionModelo) {
        return item.descripcion;
      }
    }
  }

  void getModels() async {
    await FirebaseFirestore.instance.collection('modelos').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            String name = doc["nombre"];
            String descripcion = doc["descripcion"];
            String nombreArchivo = doc["nombreArchivo"];
            String nombreImagen = doc["nombreImagen"];
            Modelo modelo =
                new Modelo(name, descripcion, nombreArchivo, nombreImagen);
            _modelos.add(modelo);
          },
        );
        print(_modelos.length);
      },
    );
    setState(() {});
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
          'Listado Presupuestos',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _presupuestos.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ExpandableNotifier(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/modelos/' +
                                  getImageModel(
                                      _presupuestos[index].nombreModelo),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                      ),
                      header: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            _presupuestos[index].nombreModelo,
                            style: Theme.of(context).textTheme.body2,
                          )),
                      collapsed: Text(
                        getDescriptionModel(_presupuestos[index].nombreModelo),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              getDescriptionModel(
                                  _presupuestos[index].nombreModelo),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}

class Presupuesto {
  String nombreModelo;
  String emailUsuario;

  Presupuesto(String nombreModelo, String emailUsuario) {
    this.nombreModelo = nombreModelo;
    this.emailUsuario = emailUsuario;
  }
}