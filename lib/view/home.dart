import 'package:flutter/material.dart';
import 'package:just_lists/view/sidebar.dart';



class Home extends StatelessWidget {
    const Home({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Row(
            
            children: <Widget>[
                Sidebar(),
                Expanded(
                    child: Container(
                        
                    )
                )
            ]
        );
    }
}