import 'package:flutter/material.dart';
import 'package:just_lists/controller/lists_controller.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/view/widget/block_button.dart';
import 'package:just_lists/view/widget/page_title.dart';

class Lists extends StatelessWidget {
    final bool isHome;

    const Lists({required this.isHome});

    @override
    Widget build(BuildContext context) {
        var _controller = ListsController(isHome);
        
        return Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                        Spacer(),
                        PageTitle(
                            texto: _controller.paginaTitulo,
                        ),
                        Spacer(flex: 5),
                        FutureBuilder(
                            future: _controller.listas,
                            builder: (context, future) {
                                var listas = <Lista>[];

                                if (future.hasData) {
                                    listas = (future.data as List<Lista>);
                                }
                                return Container(
                                    height: MediaQuery.of(context).size.height * 0.7,
                                    child: GridView.builder(
                                        padding: EdgeInsets.all(20),
                                        physics: AlwaysScrollableScrollPhysics(),
                                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 300,
                                            childAspectRatio: 4 / 3,
                                            crossAxisSpacing: 50,
                                            mainAxisSpacing: 50,
                                        ),
                                        shrinkWrap: true,
                                        itemCount: listas.length,
                                        itemBuilder: (context, index) {
                                            var lista = listas[index];

                                            return BlockButton(
                                                icone: Icons.list,
                                                titulo: lista.titulo.toString(),
                                                subtitulo: lista.usuario.nome.toString(),
                                                func: () => _controller.irParaLista(context, index),
                                            );
                                        },
                                    ),
                                );
                            },
                        ),
                    ],
                ),
            ),
        );
    }
}
