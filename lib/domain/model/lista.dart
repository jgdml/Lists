import 'package:just_lists/domain/model/registro.dart';
import 'package:just_lists/domain/model/usuario.dart';

class Lista{

    String? id;
    Usuario usuario;
    
    String? titulo;
    List<Registro?> registros;
    bool? isPrivate;

    Lista({this.id, required this.usuario, this.titulo, required this.registros, this.isPrivate=true});
}