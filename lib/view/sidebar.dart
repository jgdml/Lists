import 'package:flutter/material.dart';

class SideLayout extends StatelessWidget {
    const SideLayout({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            child: Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        children: <Widget>[
                            SizedBox(height: 70),
                            Image.asset('../assets/logo.png'),
                            Text('Titulo', style: TextStyle(color: Colors.black))
                        ]
                    )
                ),
            )
        );
    }
}