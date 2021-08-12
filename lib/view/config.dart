import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/block_button.dart';
import 'package:just_lists/view/widget/page_title.dart';

class Config extends StatelessWidget {
    const Config({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(

            body: Center(
                child: Column(children: [
                    Spacer(),

                    PageTitle(texto: "Configurações"),

                    Spacer(flex: 5),

                    Container(
                        child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            spacing: 50,
                            runSpacing: 50,
                            children: [
                                BlockButton(
                                    icone: Icons.account_box,
                                    titulo: "Conta",
                                    subtitulo: "Configurações da sua conta",
                                ),
                                BlockButton(
                                    icone: Icons.brush,
                                    titulo: "Tema",
                                    subtitulo: "Configurar tema do aplicativo",
                                )
                            ]
                        )
                    ),
                    Spacer(flex: 8)
                ])
            ),
        
        );
    }
}