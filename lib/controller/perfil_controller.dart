import 'package:flutter/material.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/domain/model/usuario.dart';
import 'package:just_lists/domain/service/usuario_service.dart';

class PerfilController{

    var _svc = UsuarioService();

    Usuario get usuario => _svc.usuario!;

    Future sair() async {
        await _svc.logout();
    }

    irParaHome(BuildContext context){
        Navigator.of(context).pushReplacementNamed(Constants.NAV_HOME);
    }

}