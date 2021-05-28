import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui_constants.dart';

class Mas extends StatefulWidget {
  @override
  _Mas createState() => _Mas();
}

class _Mas extends State<Mas> {
  FirebaseAuth auth = FirebaseAuth.instance;
  double returnResponsiveWidth(context, double originalPercentValue) {
    return MediaQuery.of(context).size.width * originalPercentValue;
  }

  @override
  void initState() {
    super.initState();
    getModels();
  }

  void getModels() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("modelos");

    QuerySnapshot models = await collectionReference.get();

    if (models.docs.length != 0) {
      for (var doc in models.docs) {
        print(doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
              child: Container(
                width: returnResponsiveWidth(context, 0.95),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage("assets/images/house.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Colors.black.withAlpha(120),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Modelo 1',
                    style: TextStyle(
                        color: colorBotones,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
