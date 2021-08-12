import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {

    final String texto;
    final Icon icone;
    final void Function()? func;

    const ListButton({
        required this.texto, 
        required this.icone, 
        required this.func
    });

    @override
    Widget build(BuildContext context) {

        return Container(
            child: TextButton.icon(
                onPressed: func,
                icon: this.icone,
                label: Text(this.texto, style: TextStyle(fontSize: 20)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
                ),
            )
        );
    }
}