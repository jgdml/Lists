import 'package:just_lists/domain/model/lista.dart';

abstract class DaoListaInterface{

    Future<List<Lista>> buscar();
    
    salvar(Lista lista);

    excluir(String id);
}