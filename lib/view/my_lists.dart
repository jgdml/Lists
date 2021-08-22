import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/block_button.dart';
import 'package:just_lists/view/widget/page_title.dart';

class MyLists extends StatelessWidget {
    const MyLists({ Key? key }) : super(key: key);


    List<Widget> showLists(){
        var res = [];

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