import 'package:flutter/material.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/domain/model/campo.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/view/widget/block_button.dart';
import 'package:just_lists/view/widget/page_title.dart';

class MyLists extends StatelessWidget {
    const MyLists({ Key? key }) : super(key: key);

    List<Lista> buscarListas(){
        var lista = <Lista>[];

        for (int i = 0; i < 5; i++){
            lista.add(
                Lista(
                    nome: (i+1).toString(), 
                    campos: [
                        Campo(
                            nome: 'campo'+i.toString(), 
                            tipo: Constants.TYPE_INT
                        )
                    ]
                )
            );
        }
        return lista;
    }

    List<Widget> showLists(){
        var res = buscarListas();

        return res.map((lista) {
            return BlockButton(
                icone: Icons.list, 
                titulo: lista.nome, 
                subtitulo: "username",
                func: () => null,
            );
        }).toList();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Column(
                    children: [
                        Spacer(),

                        PageTitle(
                            texto: "Minhas Listas",
                        ),

                        Spacer(flex: 5),
                        
                        Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            spacing: 50,
                            runSpacing: 50,
                            
                            children: showLists(),
                        ),

                        Spacer(flex: 8)
                    ],
                ),
            ),
        );
    }
}