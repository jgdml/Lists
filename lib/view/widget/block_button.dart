import 'package:flutter/material.dart';

class BlockButton extends StatelessWidget {
    final IconData icone;
    final String titulo;
    final String subtitulo;
    final Function()? func;

    const BlockButton(
            {Key? key,
            required this.icone,
            required this.titulo,
            required this.subtitulo,
            required this.func})
            : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            child: Ink(
                child: InkWell(
                    onTap: func,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: FittedBox(
                            child: Column(children: [
                                Icon(icone, size: 50, color: Theme.of(context).primaryColor),
                                Text(
                                    titulo,
                                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    subtitulo,
                                    style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                                ),
                            ]),
                        ),
                    ),
                ),
            ),
        );
    }
}
