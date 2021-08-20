import 'package:just_lists/domain/model/campo.dart';

class Lista{

    int? id;
    
    String nome;
    List<Campo> campos;
    bool isPrivate = true;

    Lista({this.id, required this.nome, required this.campos});
}