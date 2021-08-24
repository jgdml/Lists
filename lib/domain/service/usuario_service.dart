import 'package:just_lists/db/firestore/dao_usuario_fire.dart';
import 'package:just_lists/domain/exception/domain_exception.dart';
import 'package:just_lists/domain/model/usuario.dart';

class UsuarioService {
    final DaoUsuarioFire _daoUsuario = DaoUsuarioFire();

    cadastrar(String nome, String email, String senha) async {
        await _daoUsuario.cadastrar(nome, email, senha);
    }

    Usuario? get usuario => _daoUsuario.getUsuario();

    login(String email, String senha) async {
        await _daoUsuario.login(email, senha);
    }

    logout() async {
        await _daoUsuario.logout();
    }

    validarEmail(String? email){
        if (email == null || email == ""){
            throw new DomainException("O email não pode ser vazio");
        }
        // adicionar validacao de email 
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
