import 'package:just_lists/domain/model/tipo_lista.dart';

class Lista{

    int? id;
    
    String nome;
    TipoLista tipoLista;
    bool isPublic = false;

    Lista({this.id, required this.nome, required this.tipoLista});
}