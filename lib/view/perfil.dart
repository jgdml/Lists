import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:just_lists/controller/perfil_controller.dart';
import 'package:just_lists/view/widget/custom_button.dart';
import 'package:just_lists/view/widget/page_title.dart';

class Perfil extends StatelessWidget {
    Perfil({Key? key}) : super(key: key);

    final _controller = PerfilController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Column(
                    children: [
                        Spacer(),
                        PageTitle(texto: "Perfil"),
                        Spacer(flex: 5),
                        Column(
                            children: [
                                Text("Nome: " + _controller.usuario.nome.toString()),
                                CustomButton(
                                    onPressed: () async {
                                        EasyLoading.show();
                                        await _controller.sair();
                                        EasyLoading.dismiss();
                                        _controller.irParaHome(context);
                                    },
                                    icon: Icon(Icons.exit_to_app),
                                    label: "Sair da conta",
                                )
                            ],
                        ),
                        Spacer(flex: 8)
                    ],
                ),
            ),
        );
    }
}
