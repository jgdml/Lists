import 'package:flutter/cupertino.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/service/lista_service.dart';
import 'package:just_lists/domain/service/usuario_service.dart';
import 'package:mobx/mobx.dart';

part 'list_viewer_controller.g.dart';

class ListViewerController = _ListViewerController with _$ListViewerController;

abstract class _ListViewerController with Store{

    var _svc = ListaService();

    var _userSvc = UsuarioService();

    var _context;

    @observable
    Future<Lista>? lista;

    _ListViewerController(BuildContext context){
        lista = _svc.buscarUmaLista((ModalRoute.of(context)!.settings.arguments as Lista).id!);
        _context = context;
    }

    String get userId => _userSvc.usuario?.id ?? "";

    atualizarLista()async{
        lista = _svc.buscarUmaLista((await lista!).id!);
    }

    deleteReg(int index) async {
        for (var reg in (await lista!).registros){
            reg!.valores!.removeAt(index);
        }

        await _svc.salvar((await lista!));
        await atualizarLista();
    }

    excluirLista(String id) async {
        await _svc.excluir(id);

        Navigator.of(_context).pushReplacementNamed(Constants.NAV_MY_LISTS);
    }



}