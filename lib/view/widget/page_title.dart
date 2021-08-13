import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/responsive_text.dart';

class PageTitle extends StatelessWidget {
    const PageTitle({ Key? key, required this.texto }) : super(key: key);

    final String texto;


    @override
    Widget build(BuildContext context) {

        return ResponsiveText(
            this.texto,
            multiplier: 3,
            fontWeight: FontWeight.bold
        );
    }
}