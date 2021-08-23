import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/model/registro.dart';
import 'package:just_lists/view/config.dart';
import 'package:just_lists/view/create_list.dart';
import 'package:just_lists/view/home.dart';
import 'package:just_lists/view/my_lists.dart';
import 'package:just_lists/view/widget/base.dart';

import 'db/firestore/dao_lista_fire.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    runApp(JustLists());

    // testesFirestore();
}

testesFirestore() async {
    DaoListaFire daoListaFire = DaoListaFire();
    var listas = await daoListaFire.buscar();

    for (var lista in listas) {
        print(lista.titulo);
    }

    daoListaFire.salvar(
        Lista(
            titulo: 'Tech',
            registros: [
                Registro(
                    nome: 'Nome',
                    tipo: 'Texto',
                    valores: ['Pilhas', 'Pendrive'],
                ),
                Registro(
                    nome: 'Loja',
                    tipo: 'Texto',
                    valores: ['Americanas', 'Kabum'],
                ),
                Registro(
                    nome: 'Preço',
                    tipo: 'Preço',
                    valores: ['1,20', '30,00'],
                ),
            ],
            isPrivate: true,
        ),
    );
}

class JustLists extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'JustLists',
            theme: ThemeData(
                primarySwatch: Colors.red,
            ),
            routes: {
                Constants.NAV_HOME: (context) => Base(Home()),
                Constants.NAV_CREATE_LIST: (context) => Base(CreateList(), selected: 1),
                Constants.NAV_MY_LISTS: (context) => Base(MyLists(), selected: 2),
                Constants.NAV_CONFIG: (context) => Base(Config(), selected: 3)
            },
        );
    }
}
