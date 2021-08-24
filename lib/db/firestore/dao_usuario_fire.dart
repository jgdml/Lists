import 'package:firebase_auth/firebase_auth.dart';
import 'package:just_lists/domain/interface/dao_usuario_i.dart';
import 'package:just_lists/domain/model/usuario.dart';

class DaoUsuarioFire implements DaoUsuarioInterface {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    @override
    cadastrar(String nome, String email, String senha) async {
        await _auth.createUserWithEmailAndPassword(email: email, password: senha)
            .then((usuario) => usuario.user!.updateDisplayName(nome));
    }

    @override
    login(String email, String senha) async {
        await _auth.signInWithEmailAndPassword(email: email, password: senha);
    }

    @override
    Usuario? getUsuario() {        
        var u = _auth.currentUser;
        if (u != null) {
            return Usuario(id: u.uid, nome: u.displayName);
        } else {
            return null;
        }
    }

    @override
    logout() async {
        await _auth.signOut();
    }
}
