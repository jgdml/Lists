import 'package:just_lists/domain/model/usuario.dart';

abstract class DaoUsuarioInterface{

    cadastrar(String nome, String email, String senha);

    login(String email, String senha);

    logout();

    Usuario? getUsuario();

}