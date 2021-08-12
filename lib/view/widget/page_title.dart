import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
    const PageTitle({ Key? key, required this.texto }) : super(key: key);

    final String texto;


    @override
    Widget build(BuildContext context) {
        var fontSize = (MediaQuery.of(context).size.width + MediaQuery.of(context).size.height) *0.02;

        return Text(
            this.texto,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        );
    }
}