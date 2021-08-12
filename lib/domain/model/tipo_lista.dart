import 'package:just_lists/domain/model/campo.dart';

class TipoLista{

    int? id;

    String nome;
    List<Campo> campos;

    TipoLista({required this.nome, required this.campos});

}