import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
    const ResponsiveText(this.text, { Key? key, this.multiplier = 1, this.fontWeight, this.color }) : super(key: key);

    final String text;
    final double multiplier;
    final FontWeight? fontWeight;
    final Color? color;

    @override
    Widget build(BuildContext context) {
        var _wSize = MediaQuery.of(context).size;

        return Text(
            text,
            style: TextStyle(
                fontSize: (_wSize.width *0.01) * multiplier,
                fontWeight: fontWeight,
                color: color
            )
        );
    }
}
