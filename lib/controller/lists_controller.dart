import 'package:flutter/material.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/service/lista_service.dart';


class ListsController{

    var _svc = ListaService();

    Future<List<Lista>>? listas;
    bool isHome;

    ListsController(this.isHome){
        atualizarLista();
    }

    String get paginaTitulo => isHome ? "Início" : "Minhas Listas";

    atualizarLista() async {
        if (isHome){
            listas = _svc.buscar();
        }
        else{
            listas = _svc.buscar(idUsuario: "");
        }
    }

    irParaLista(BuildContext context, int index){
        Navigator.of(context).pushReplacementNamed(Constants.NAV_LIST_VIEWER);
    }


}