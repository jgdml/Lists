import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:just_lists/view/widget/custom_button.dart';
import 'package:just_lists/view/widget/widget_controller/login_modal_controller.dart';

class LoginModal extends StatefulWidget {
    const LoginModal({Key? key}) : super(key: key);

    @override
    _LoginModalState createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
    final _formState = GlobalKey<FormState>();

    var _controller = LoginModalController();

    Widget emailField() {
        return TextFormField(
            onSaved: (val) => _controller.email = val ?? "",
            validator: _controller.validarEmail,
            autofocus: true,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
            ),
        );
    }

    Widget passField() {
        return TextFormField(
            onSaved: (val) => _controller.senha = val ?? "",
            validator: _controller.validarSenha,
            style: TextStyle(fontSize: 18),
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
            ),
        );
    }

    Widget loginButton(BuildContext context) {
        return CustomButton(
            onPressed: () {
                EasyLoading.show();
                _formState.currentState!.validate();
                _formState.currentState!.save();

                if (_controller.isValidoLogin) {
                    _controller.login().then((v) {
                        EasyLoading.dismiss();
                        _controller.irParaMinhasListas(context);
                    });
                }
            },
            icon: Icon(Icons.next_plan),
            label: "Fazer Login",
        );
    }

    Widget cadastroButton() {
        return CustomButton(
            onPressed: () => null,
            icon: Icon(Icons.person_add),
            label: "Fazer cadastro",
        );
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            child: AlertDialog(
                title: Text("Login"),
                content: Container(
                    width: 500,
                    height: 300,
                    child: Form(
                        key: _formState,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                emailField(),
                                passField(),
                                loginButton(context),
                                cadastroButton(),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}
