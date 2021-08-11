import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/view/widget/list_button.dart';

class Sidebar extends StatelessWidget {




    @override
    Widget build(BuildContext context) {
        var sidebarW = MediaQuery.of(context).size.width * 0.2;
        var sidebarH = MediaQuery.of(context).size.height;

        return Container(
            width: sidebarW,
            alignment: Alignment.center,

            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
            ),

            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                    Spacer(),
                    Image(
                        image: AssetImage('assets/logo.png'),
                        height: sidebarH*0.1,
                    ),
                    Spacer(),

                    ListButton(
                        texto: Text("Nova lista"), 
                        icone: Icon(Icons.add), 
                        func: () => Navigator.of(context).pushReplacementNamed(Constants.NAV_CREATE_LIST)
                    ),

                    Container(
                        width: sidebarW*0.7,
                        height: sidebarH*0.7,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: AlwaysScrollableScrollPhysics(),

                            itemCount: 16,
                            itemBuilder: (BuildContext context, int index){
                                return ListButton(
                                    texto: Text("Lista "+(index+1).toString()), 
                                    icone: Icon(Icons.list), 
                                    func: () => print(index.toString())
                                );
                            }
                        ),
                    ),
                
                    Spacer(),
                    ListButton(
                        texto: Text("Configurações"), 
                        icone: Icon(Icons.settings), 
                        func: () => Navigator.of(context).pushReplacementNamed(Constants.NAV_CONFIG)
                    ),
                ],
            ),
        );
    }
}