import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:just_lists/domain/interface/dao_lista_i.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/model/registro.dart';
import 'package:just_lists/domain/model/usuario.dart';

class DaoListaFire implements DaoListaInterface {
    late CollectionReference listaCollection;

    DaoListaFire() {
        listaCollection = FirebaseFirestore.instance.collection('lista');
    }


    @override
    Future<List<Lista>> buscar({idUsuario}) async {
        QuerySnapshot<Object?> res;

        if (idUsuario != null){
            res = await listaCollection.where('idUsuario', isEqualTo: idUsuario).get();
        }
        else {
            res = await listaCollection.where('isPrivate', isEqualTo: false).get();
        }

        var listas = res.docs.map((lista) {
            return _convertToLista(lista);
        });

        return listas.toList();
    }

    Future<Lista> buscarPorId(String id) async {
        var res = await listaCollection.doc(id).get();

        return _convertToLista(res);
    }

    Lista _convertToLista(var lista) {
        Lista convLista;

        var registros = lista['registros'].map<Registro>((reg) {
            return Registro(
                nome: reg['nome'],
                tipo: reg['tipo'],
                valores: reg['valores'],
            );
        }).toList();


        convLista = Lista(
            id: lista.id,
            usuario: Usuario(id: lista['idUsuario'], nome: lista['nomeUsuario'],),
            titulo: lista['titulo'],
            isPrivate: lista['isPrivate'],
            registros: registros,
        );

        return convLista;
    }


    @override
    excluir(String id) async {
        await listaCollection.doc(id).delete();
    }

    Object? _convertToDocument(Lista lista){

        var convDoc;

        convDoc = {
            'idUsuario': lista.usuario.id,
            'nomeUsuario': lista.usuario.nome,
            'titulo': lista.titulo,
            'isPrivate': lista.isPrivate,
            'registros': lista.registros.map(
                (reg) {
                    return {
                        "nome": reg!.nome,
                        "tipo": reg.tipo,
                        "valores": reg.valores
                    };
                }
            )
        };

        return convDoc;

    }

    @override
    salvar(Lista lista) async {
        await listaCollection.doc(lista.id).set(_convertToDocument(lista));
    }
}
