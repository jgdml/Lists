import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/list_item.dart';



class Home extends StatelessWidget {
    const Home({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            child: Column(
                children: [
                    ListItem(),
                    ListItem(),
                    ListItem()
                ]
            )
        );
    }
}