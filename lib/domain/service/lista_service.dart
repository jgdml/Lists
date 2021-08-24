import 'package:just_lists/db/firestore/dao_lista_fire.dart';
import 'package:just_lists/domain/exception/domain_exception.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/model/registro.dart';

class ListaService {

    var _daoLista = DaoListaFire();

    
    Future<List<Lista>> buscar({idUsuario}) {
        return _daoLista.buscar(idUsuario: idUsuario);
    }

    
    excluir(String id) {
        _daoLista.excluir(id);
    }

    
    salvar(Lista lista) {
        _daoLista.salvar(lista);
    }


    validarTitulo(String? titulo){
        if (titulo == null || titulo == ""){
            throw new DomainException("Título não pode ser vazio");
        }
    }

    validarRegistros(List<Registro?>? regs){
        if (regs!.length < 1){
            throw new DomainException("A lista precisa ter ao menos um campo");
        }
    }

    validarRegistroNome(String? nome){
        if (nome == null || nome == ""){
            throw new DomainException("Todo campo precisa ter um nome");
        }
    }
    validarRegistroTipo(String? tipo){
        if (tipo == null || tipo == ""){
            throw new DomainException("Todo campo precisa ter um tipo");
        }
    }
}
