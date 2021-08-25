import 'package:email_validator/email_validator.dart';
import 'package:just_lists/db/firestore/dao_usuario_fire.dart';
import 'package:just_lists/domain/exception/auth_exception.dart';
import 'package:just_lists/domain/exception/domain_exception.dart';
import 'package:just_lists/domain/model/usuario.dart';

class UsuarioService {
    final DaoUsuarioFire _daoUsuario = DaoUsuarioFire();

    cadastrar(String nome, String email, String senha) async {
        try{
            await _daoUsuario.cadastrar(nome, email, senha);
        }
        catch (err){
            identificarErro(err, "cadastro");
        }
        
    }

    Usuario? get usuario => _daoUsuario.getUsuario();

    login(String email, String senha) async {
        try{
            await _daoUsuario.login(email, senha);
        }
        catch (err){
            identificarErro(err, "login");
        }
    }

    identificarErro(var err, String operacao){
        var errStr = err.toString();

        if (operacao == "login"){
            if (errStr.contains("[firebase_auth/wrong-password]") || errStr.contains("[firebase_auth/user-not-found]")){
                throw new AuthException("O email ou senha estão incorretos");
            }
            else {
               throw new AuthException("Ocorreu um erro ao realizar o login");
            }

        }

        else if (operacao == "cadastro"){
            if (errStr.contains("[firebase_auth/email-already-in-use]")){
                throw new AuthException("Este email já esta cadastrado");
            }
            else {
               throw new AuthException("Ocorreu um erro ao realizar o cadastro");
            }
        }


        
    }

    logout() async {
        await _daoUsuario.logout();
    }

    validarEmail(String? email){
        if (email == null || email == ""){
            throw new DomainException("O email não pode ser vazio");
        }
        else if (EmailValidator.validate(email) == false){
            throw new DomainException("O email não é válido");
        }
    }

    validarSenha(String? senha){
        if (senha == null || senha == ""){
            throw new DomainException("A senha não pode ser vazia");
        }
        else if (senha.length < 6){
            throw new DomainException("A senha deve ter no mínimo 6 caracteres");
        }
    }

    validarNome(String? nome){
        if (nome == null || nome == ""){
            throw new DomainException("O nome não pode ser vazio");
        }
        else if (nome.length < 3){
            throw new DomainException("O nome deve ter ao menos 3 caracteres");
        }
    }
}
