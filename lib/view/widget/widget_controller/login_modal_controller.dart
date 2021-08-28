import 'package:flutter/cupertino.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/domain/service/usuario_service.dart';
import 'package:mobx/mobx.dart';

part 'login_modal_controller.g.dart';

class LoginModalController = _LoginModalController with _$LoginModalController;


abstract class _LoginModalController with Store{

    @observable
    bool isLogin = true;

    bool _emailValido = false;
    bool _senhaValida = false;
    bool _senhaRepeatValida = false;
    bool _nomeValido = false;

    String email = "";
    String senha = "";
    String senhaRepeat = "";
    String nome = "";

    var _svc = UsuarioService();


    @action
    toggleIsLogin(){
        isLogin = !isLogin;
    }


    Future<String?> login() async {
        try{
            await _svc.login(email, senha);
            return null;
        }
        catch (err){
            return err.toString();
        }
    }

    Future<String?> cadastrar() async {
        try{
            await _svc.cadastrar(nome, email, senha);
            return null;
        }
        catch (err){
            return err.toString();
        }
        
    }

    irParaMinhasListas(BuildContext context){
        Navigator.of(context).pushReplacementNamed(Constants.NAV_MY_LISTS);
    }

    bool get isValidoLogin => _emailValido && _senhaValida;
    bool get isValidoCadastro => _emailValido && _senhaValida && _senhaRepeatValida && _nomeValido;

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

    String? validarSenhaRepeat(String? senhaRepeat){
        if (this.senha == senhaRepeat){
            _senhaRepeatValida = true;
            return null;
        }
        else {
            _senhaRepeatValida = false;
            return "As senhas são diferentes";
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