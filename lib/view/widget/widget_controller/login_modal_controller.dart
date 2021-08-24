import 'package:flutter/cupertino.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/domain/service/usuario_service.dart';

class LoginModalController{

    bool _emailValido = false;
    bool _senhaValida = false;
    bool _nomeValido = false;

    String email = "";
    String senha = "";
    String nome = "";

    var _svc = UsuarioService();


    Future login() async {
        await _svc.login(email, senha);        
    }

    irParaMinhasListas(BuildContext context){
        Navigator.of(context).pushReplacementNamed(Constants.NAV_MY_LISTS);
    }

    bool get isValidoLogin => _emailValido && _senhaValida;
    bool get isValidoCadastro => _emailValido && _senhaValida && _nomeValido;

    String? validarEmail(String? email){
        try{
            _svc.validarEmail(email);
            _emailValido = true;
            return null;
        }
        catch (err){
            _emailValido = false;
            return err.toString();
        }
    }

    String? validarSenha(String? senha){
        try{
            _svc.validarSenha(senha);
            _senhaValida = true;
            return null;
        }
        catch (err){
            _senhaValida = false;
            return err.toString();
        }
    }

    String? validarNome(String? nome){
        try{
            _svc.validarNome(nome);
            _nomeValido = true;
            return null;
        }
        catch (err){
            _nomeValido = false;
            return err.toString();
        }
    }



}