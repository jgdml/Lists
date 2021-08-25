import 'package:flutter/material.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/service/lista_service.dart';
import 'package:just_lists/domain/service/usuario_service.dart';


class ListsController{

    var _svc = ListaService();

    var _userSvc = UsuarioService();

    Future<List<Lista>>? listas;
    bool isHome;

    ListsController(this.isHome){
        atualizarLista();
    }

    String get paginaTitulo => isHome ? "Início" : "Minhas Listas";

    bool get isLogado => _userSvc.usuario != null;

    atualizarLista() async {
        if (isHome){
            listas = _svc.buscar();
        }
        else{
            listas = _svc.buscar(idUsuario: isLogado ? _userSvc.usuario!.id : "");
        }
    }

    irParaLista(BuildContext context, int index){
        Navigator.of(context).pushReplacementNamed(Constants.NAV_LIST_VIEWER);
    }


}