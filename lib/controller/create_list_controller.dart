import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/service/lista_service.dart';

class CreateListController{

    Lista? lista;

    var _svc = ListaService();

    CreateListController(){
        lista = Lista();
    }


    salvar() async {
        await _svc.salvar(this.lista!);
    }
    

}