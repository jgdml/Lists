import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
    const DecoratedContainer({ Key? key, required this.child }) : super(key: key);

    final Widget child;

    @override
    Widget build(BuildContext context) {
        var sizeW = MediaQuery.of(context).size.width * 0.6;
        var sizeH = MediaQuery.of(context).size.height * 0.7;

        return Container(
            width: sizeW,
            height: sizeH,
            
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(2, 2))]
            ),
            padding: EdgeInsets.all(sizeW * 0.1),
            
            child: child
        );
    }
}