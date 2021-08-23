import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:just_lists/domain/interface/dao_lista_i.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/model/registro.dart';

class DaoListaFire implements DaoListaInterface {
    late CollectionReference listaCollection;

    DaoListaFire() {
        listaCollection = FirebaseFirestore.instance.collection('lista');
    }


    @override
    Future<List<Lista>> buscar() async {
        var res = await listaCollection.get();

        var listas = res.docs.map((lista) {
            return _convertToLista(lista);
        });

        return listas.toList();
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
            'titulo': lista.titulo,
            'isPrivate': lista.isPrivate,
            'registros': lista.registros!.map(
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
