import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
    const Sidebar({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        var screenW = MediaQuery.of(context).size.width;
        var screenH = MediaQuery.of(context).size.height;

        return Container(
            color: Colors.grey.shade900,
            padding: EdgeInsets.only(left: screenW*0.03, right: screenW*0.03),
            child: Column(
                children: <Widget>[

                    Image(
                        image: AssetImage('assets/logo.png'),
                        width: screenW*0.1,
                    ),

                    SizedBox(height: screenH*0.03),
                ],
            ),
        );
    }
}