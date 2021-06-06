import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:my_paradise/pojo/modelo.dart';
import 'package:my_paradise/pojo/presupuesto.dart';

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
    print(_presupuestos.toString());
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

  Future deletePresupuesto(String nombreModelo) async {
    await FirebaseFirestore.instance.collection('presupuestos').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            String name = doc["nombreModelo"];
            if (name == nombreModelo) {
              FirebaseFirestore.instance
                  .collection('presupuestos')
                  .doc(doc.id)
                  .delete();
              return;
            }
          },
        );
        print(_presupuestos.length);
      },
    );
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
          'Presupuestos Solicitados',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondos/fondo_presupuestos.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
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
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/fotosModelos/' +
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
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    _presupuestos[index].nombreModelo,
                                    style: Theme.of(context).textTheme.body2,
                                  ),
                                  InkWell(
                                    child: Icon(Icons.delete),
                                    onTap: () async {
                                      await deletePresupuesto(
                                          _presupuestos[index].nombreModelo);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("Solicitud '" +
                                            _presupuestos[index].nombreModelo +
                                            "' eliminada"),
                                      ));
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        collapsed: Text(
                          getDescriptionModel(
                              _presupuestos[index].nombreModelo),
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
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
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
      ),
    );
  }
}
