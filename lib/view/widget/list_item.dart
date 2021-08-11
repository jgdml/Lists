import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
    const ListItem({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Row(
            children: [
                Text('a'),
                Text('b'),
                Text('c'),
                Text('d'),
            ]
        );
    }
}