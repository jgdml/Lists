import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/page_title.dart';

class MyLists extends StatelessWidget {
    const MyLists({ Key? key }) : super(key: key);

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

                        Spacer(flex: 8)
                    ],
                ),
            ),
        );
    }
}