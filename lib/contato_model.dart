import 'package:hive/hive.dart';

part 'contato_model.g.dart';

@HiveType(typeId: 0)
class ContatoModel{
  @HiveField(0)
  final String nome;
  @HiveField(1)
  final String endereco;
  @HiveField(2)
  final String telefone;

 ContatoModel({this.nome, this.endereco, this.telefone});
}
