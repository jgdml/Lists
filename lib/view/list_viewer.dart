import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/page_title.dart';

class ListViewer extends StatelessWidget {
    const ListViewer({Key? key}) : super(key: key);



    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Column(
                    children: [
                        Spacer(),
                        PageTitle(texto: "Lista {nome}"),
                        Spacer(flex: 5),
                    ],
                ),
            ),
        );
    }
}
