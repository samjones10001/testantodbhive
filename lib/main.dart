import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testantodbhive/contato_model.dart';
import 'package:hive/hive.dart';

const String contatoBoxName = "contato";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    final caminho = "C:\\Users\\luisf\\Documents";
    Hive.init(caminho);
  } else {
    final document = await getApplicationDocumentsDirectory();
print(document.path);
    Hive.init(document.path);
  }
  Hive.registerAdapter(ContatoModelAdapter());
  await Hive.openBox<ContatoModel>(contatoBoxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Hive',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Testando db Hive'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Box<ContatoModel> contatoBox;
  List<ContatoModel> conf;
  int conta = 0;


  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  void _adicionarDados() {
    ContatoModel contato = ContatoModel(nome: "Luis Felipe",endereco: "Este", telefone: "33252148");
    contatoBox.add(contato);
    print("Registro adicionado");
    print(contatoBox.length);
  }

  void  _mostrarDados() async {
    List<ContatoModel> cont = contatoBox.values.toList();
    setState(() {
      conf = cont;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contatoBox = Hive.box<ContatoModel>(contatoBoxName);
    _mostrarDados();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: conf.length,
                  itemBuilder: (BuildContext context, int index){
                    return new Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.blueGrey[400],
                      child: InkWell(
                        onTap: (){
                          //                          Navigator.push(context, MaterialPageRoute(builder: (context){
                          //                             return editarPage(valorRecebido: conf[index].nomeCurso.toString(),localArmazena: conf[index].localArmazena,);
                          //                           }));
                          //                           print("Nome da lista selecionado - "+conf[index].nomeCurso.toString());
                        },
                        child: Text(conf[index].nome,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                      ),);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
              child: FlatButton(
                padding: EdgeInsets.only(left: 85.0,top: 10.0, right: 85.0,bottom: 10.0,),
                child: Text('Adicionar' ,style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0),
                ),   shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0)),onPressed: _adicionarDados,color:  Colors.grey[800],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
              child: FlatButton(
                padding: EdgeInsets.only(left: 85.0,top: 10.0, right: 85.0,bottom: 10.0,),
                child: Text('Mostrar' ,style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0),
                ),   shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0)),onPressed: _mostrarDados,color:  Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarDados,
        tooltip: 'Adicionar Contatos',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
