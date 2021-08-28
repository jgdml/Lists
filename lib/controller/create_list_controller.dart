import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/model/registro.dart';
import 'package:just_lists/domain/model/usuario.dart';
import 'package:just_lists/domain/service/lista_service.dart';
import 'package:just_lists/domain/service/usuario_service.dart';
import 'package:mobx/mobx.dart';

part 'create_list_controller.g.dart';

class CreateListController = _CreateListController with _$CreateListController;


abstract class _CreateListController with Store{

    @observable
    Lista? lista;

    var _svc = ListaService();

    var _userSvc = UsuarioService();

    bool _tituloValido = false;
    var _registroValido = false;


    _CreateListController(){
        if (this.isLogado){
            lista = Lista(registros: <Registro>[], usuario: _userSvc.usuario!);
        }
        else{
            lista = Lista(registros: <Registro>[], usuario: Usuario(id: "", nome: ""));
        }
    }

    bool get isLogado => _userSvc.usuario != null;

    bool get isValido => _tituloValido && _registroValido;

    @action
    switchPrivacy(bool val){
        lista!.isPrivate = val;
        lista = lista;
    }

    @action
    changeRegType(int regPos, String val){
        lista!.registros[regPos]!.tipo = val;
        lista = lista;
    }

    @action
    addReg(){
        lista!.registros.add(Registro());
        lista = lista;
    }

    @action
    removeLastReg(){
        try{
            lista!.registros.removeLast();
            lista = lista;
        }
        catch (RangeError){}
        
    }


    salvar() async {
        await _svc.salvar(this.lista!);
    }
    
    String? validarTitulo(String? titulo){
        try{
            _svc.validarTitulo(titulo);
            _tituloValido = true;
            return null;
        }
        catch(err) {
            _tituloValido = false;
            return err.toString();
        }
    }

    String? validarRegistros(){
        try{
            _svc.validarRegistros(lista!.registros);
            
            for (var reg in (lista!.registros)){
                _svc.validarRegistroNome(reg!.nome);
                _svc.validarRegistroTipo(reg.tipo);
            }
            _registroValido = true;
            return null;
        }
        catch(err) {
            _registroValido = false;
            return err.toString();
        }
    }

}