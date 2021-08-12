import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:just_lists/view/widget/list_button.dart';
import 'package:just_lists/view/widget/sidebar_back.dart';

class Sidebar extends StatelessWidget {

    final _back = SidebarBack();

    final int selected;

    Sidebar({this.selected = 0});

    @override
    Widget build(BuildContext context) {
        var sidebarW = MediaQuery.of(context).size.width * 0.18;
        var sidebarH = MediaQuery.of(context).size.height;

        return Container(
            width: sidebarW,
            alignment: Alignment.center,

            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
            ),

            child: Column(
                children: <Widget>[

                    Spacer(),

                    InkWell(
                        onTap: () => _back.goToHome(context),
                        child: Image(
                            image: AssetImage('assets/logo.png'),
                            height: sidebarH*0.1,
                        ),
                    ),

                    Spacer(),
                    
                    ListButton(
                        texto: "Nova lista", 
                        icone: Icon(Icons.add), 
                        func: selected == 1 ? null : () => _back.goToCreateList(context) 
                    ),

                    Spacer(),

                    ListButton(
                        texto: "Minhas Listas", 
                        icone: Icon(Icons.list), 
                        func: selected != 2 ? () => _back.goToMyLists(context) : null
                    ),

                    Spacer(flex: 16),

                    ListButton(
                        texto: "Configurações", 
                        icone: Icon(Icons.settings), 
                        func: selected != 3 ? () => _back.goToConfig(context) : null
                    ),
                ],
            ),
        );
    }
}