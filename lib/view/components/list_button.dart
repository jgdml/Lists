import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {

    final Text texto;
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
            margin: EdgeInsets.only(bottom: 15),
            child: TextButton.icon(
                onPressed: func,
                icon: this.icone,
                label: this.texto,
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20))
                ),
            )
        );
    }
}