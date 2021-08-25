import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:just_lists/domain/service/usuario_service.dart';
import 'package:just_lists/view/widget/list_button.dart';
import 'package:just_lists/view/widget/login_modal.dart';
import 'package:just_lists/view/widget/widget_controller/sidebar_controller.dart';

class Sidebar extends StatelessWidget {

    final _back = SidebarController();

    final _userSvc = UsuarioService();

    final int selected;

    Sidebar({this.selected = 0});

    Widget accountButton(context){
        if (_userSvc.usuario == null){
            return ListButton(
                width: double.infinity,
                texto: "Login", 
                icone: Icon(Icons.next_plan),
                func: () => showDialog(
                    context: context, 
                    builder: (context) => LoginModal()
                ),
                selected: selected == 3,
            );
        }
        else{
            return ListButton(
                width: double.infinity,
                texto: "Conta", 
                icone: Icon(Icons.account_box), 
                func: () => _back.goToConfig(context),
                selected: selected == 3,
            );
        }
    }

    @override
    Widget build(BuildContext context) {

        return Container(
            width: MediaQuery.of(context).size.width * 0.2,
            alignment: Alignment.center,

            decoration: BoxDecoration(
                color: Colors.grey.shade900,
            ),

            child: Column(
                children: <Widget>[

                    Spacer(),

                    InkWell(
                        onTap: () => _back.goToHome(context),
                        child: Image(
                            image: AssetImage('assets/logo.png'),
                        ),
                    ),
                    

                    Spacer(),
                    
                    ListButton(
                        width: double.infinity,
                        texto: "Nova lista", 
                        icone: Icon(Icons.add), 
                        func: () => _back.goToCreateList(context),
                        selected: selected == 1,
                    ),

                    Spacer(),

                    ListButton(
                        width: double.infinity,
                        texto: "Minhas Listas", 
                        icone: Icon(Icons.list), 
                        func: () => _back.goToMyLists(context),
                        selected: selected == 2,
                    ),



                    Spacer(flex: 18),

                    accountButton(context)
                ],
            ),
        );
    }
}