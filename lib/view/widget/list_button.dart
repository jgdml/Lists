import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {

    final String texto;
    final Icon icone;
    final void Function()? func;

    final bool selected;
    final double? width;

    const ListButton({
        required this.texto, 
        required this.icone, 
        required this.func,

        this.width,
        this.selected = false
    });

    @override
    Widget build(BuildContext context) {

        return Container(
            width: width,
            child: TextButton.icon(
                
                onPressed: selected ? null : func,
                icon: this.icone,                
                label: Text(this.texto, style: TextStyle(fontSize: 18, color: selected ? Colors.white : null)),
                
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(26)),
                
                    backgroundColor: selected ? MaterialStateProperty.all<Color>(Colors.lightBlue) : null,

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                    )
                ),
            )
        );
    }
}