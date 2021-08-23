import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/model/registro.dart';
import 'package:just_lists/domain/service/lista_service.dart';

class CreateListController{

    Lista? lista;

    var _svc = ListaService();

    bool _tituloValido = false;
    bool _registroValido = false;


    CreateListController(){
        lista = Lista(registros: <Registro>[]);
    }

    bool get isValido => _tituloValido && _registroValido;

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
            _registroValido = true;
            return null;
        }
        catch(err) {
            _registroValido = false;
            return err.toString();
        }
    }

    String? validarRegistroNome(String? regNome){
        try{
            _svc.validarRegistroNome(regNome);
            _registroValido = true;
            return null;
        }
        catch(err) {
            _registroValido = false;
            return err.toString();
        }
    }

    String? validarRegistroTipo(String? regTipo){
        try{
            _svc.validarRegistroTipo(regTipo);
            _registroValido = true;
            return null;
        }
        catch(err) {
            _registroValido = false;
            return err.toString();
        }
    }



}