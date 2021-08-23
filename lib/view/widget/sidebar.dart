import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:just_lists/view/widget/list_button.dart';
import 'package:just_lists/view/widget/widget_controller/sidebar_controller.dart';

class Sidebar extends StatelessWidget {

    final _back = SidebarController();

    final int selected;

    Sidebar({this.selected = 0});

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
                        width: sidebarW,
                        texto: "Nova lista", 
                        icone: Icon(Icons.add), 
                        func: () => _back.goToCreateList(context),
                        selected: selected == 1,
                    ),

                    Spacer(),

                    ListButton(
                        width: sidebarW,
                        texto: "Minhas Listas", 
                        icone: Icon(Icons.list), 
                        func: () => _back.goToMyLists(context),
                        selected: selected == 2,
                    ),

                    Spacer(flex: 18),

                    ListButton(
                        width: sidebarW,
                        texto: "Configurações", 
                        icone: Icon(Icons.settings), 
                        func: () => _back.goToConfig(context),
                        selected: selected == 3,
                    ),
                ],
            ),
        );
    }
}