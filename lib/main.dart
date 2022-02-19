// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers, camel_case_types, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(k());
}

class k extends StatefulWidget {
  @override
  _kState createState() => _kState();
}

class _kState extends State<k> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GESTION DE NOTE ET FRAIS"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            RichText(
                text: TextSpan(
              text: 'Bienvenu sur Deep Bill\n'.toUpperCase(),
              style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),
              children: [
                TextSpan(text: 'Application de Gestion\n'.toUpperCase()),
                TextSpan(text: 'Note et Frais.\n'.toUpperCase())
              ],
            )),
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => List()),
                        );
                      },
                      color: Colors.blue[900],
                      child: Text(
                        "Listes des factures",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Add()),
                        );
                      },
                      color: Colors.blue[900],
                      child: Text(
                        "Ajouter une facture",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Add extends StatefulWidget {
  @override
  addState createState() => addState();
}

class addState extends State<Add> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GESTION DE NOTE ET FRAIS"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            RichText(
                text: TextSpan(
              text: 'Bienvenu sur Deep Bill\n'.toUpperCase(),
              style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),
              children: [
                TextSpan(text: 'Application de Gestion\n'.toUpperCase()),
                TextSpan(text: 'Note et Frais.\n'.toUpperCase())
              ],
            )),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 280,
              width: 250,
              color: Colors.black12,
              child: file == null
                  ? Icon(
                      Icons.image,
                      size: 30,
                    )
                  : Image.file(
                      file!,
                      fit: BoxFit.fill,
                    ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {
                        getgall();
                      },
                      color: Colors.blue[900],
                      child: Text(
                        "take from gallery",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {
                        getcam();
                      },
                      color: Colors.blue[900],
                      child: Text(
                        "take from camera",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getcam() async {
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}

class List extends StatefulWidget {
  @override
  listState createState() => listState();
}

class listState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GESTION DE NOTE ET FRAIS"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Facture payé')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Facture non payé')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
