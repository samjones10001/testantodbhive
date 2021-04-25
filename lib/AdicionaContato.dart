import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testantodbhive/contato_model.dart';
import 'package:hive/hive.dart';

class AdicionarContato extends StatefulWidget {
  @override
  _AdicionarContatoState createState() => _AdicionarContatoState();
}

class _AdicionarContatoState extends State<AdicionarContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Contato"),
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
