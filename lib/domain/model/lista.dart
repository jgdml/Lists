import 'package:just_lists/domain/model/registro.dart';

class Lista{

    String? id;
    
    String titulo;
    List<Registro?> registros;
    bool isPrivate;

    Lista({this.id, required this.titulo, required this.registros, required this.isPrivate});
}