import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/responsive_text.dart';

class BlockButton extends StatelessWidget {

    final IconData icone;
    final String titulo;
    final String subtitulo;
    final Function()? func;

    const BlockButton({ 
        Key? key, 
        required this.icone, 
        required this.titulo, 
        required this.subtitulo, 
        this.func
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Ink(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(2, 2))]
            ),
            
            child: InkWell(
                onTap: () => null,

                child: Container(
                    padding: EdgeInsets.all(50),

                    child: Column(children: [
                        Icon(icone, size: 50, color: Theme.of(context).primaryColor),
                        ResponsiveText(
                            titulo, 
                            multiplier: 1.22, 
                            fontWeight: FontWeight.bold
                            
                        ),
                        ResponsiveText(
                            subtitulo,
                            multiplier: 1.22,
                            color: Colors.grey.shade600
                        )
                    ]),
                ),
            ),
        );
    }
}