import 'package:just_lists/domain/model/lista.dart';

abstract class DaoListaInterface{

    Future<List<Lista>> buscar({String? idUsuario});
    
    salvar(Lista lista);

    excluir(String id);
}