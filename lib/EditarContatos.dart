import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testantodbhive/contato_model.dart';
import 'package:hive/hive.dart';

class EditarContatos extends StatefulWidget {
  @override
  _EditarContatosState createState() => _EditarContatosState();
}

class _EditarContatosState extends State<EditarContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Contato"),
      ),
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
