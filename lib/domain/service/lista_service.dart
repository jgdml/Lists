import 'package:just_lists/db/firestore/dao_lista_fire.dart';
import 'package:just_lists/domain/model/lista.dart';

class ListaService {

    var _daoLista = DaoListaFire();

    @override
    Future<List<Lista>> buscar() {
        return _daoLista.buscar();
    }

    @override
    excluir(String id) {
        _daoLista.excluir(id);
    }

    @override
    salvar(Lista lista) {
        _daoLista.salvar(lista);
    }
}
