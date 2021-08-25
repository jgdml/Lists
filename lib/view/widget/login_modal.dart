import 'dart:ui';

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
    final _formStateCadastro = GlobalKey<FormState>();

    final _controller = LoginModalController();

    bool _isLogin = true;

    _toggleisLogin() {
        setState(() {
            _isLogin = !_isLogin;
        });
    }

    Widget nameField() {
        return TextFormField(
            onSaved: (val) => _controller.nome = val ?? "",
            validator: _controller.validarNome,
            autofocus: true,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                labelText: "Nome",
                border: OutlineInputBorder(),
            ),
        );
    }

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
    
    Widget passRepeatField(){
        return TextFormField(
            onSaved: (val) => _controller.senhaRepeat = val ?? "",
            validator: _controller.validarSenhaRepeat,
            style: TextStyle(fontSize: 18),
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Repita a senha",
                border: OutlineInputBorder(),
            ),
        );
    }

    Widget loginButton(BuildContext context) {
        return CustomButton(
            onPressed: () async {
                EasyLoading.show();
                _formState.currentState!.validate();
                _formState.currentState!.save();

                if (_controller.isValidoLogin) {
                    var res = await _controller.login();

                    if (res == null){
                        _controller.irParaMinhasListas(context);
                    }
                    else{
                        showErr(context, res);
                    }
                }
                EasyLoading.dismiss();
            },
            icon: Icon(Icons.next_plan),
            label: "Entrar",
        );
    }

    Widget gotoCadastro() {
        return CustomButton(
            onPressed: () => _toggleisLogin(),
            icon: Icon(Icons.person_add),
            label: "Fazer cadastro",
        );
    }

    Widget cadastroButton() {
        return CustomButton(
            onPressed: () async {
                EasyLoading.show();

                _formStateCadastro.currentState!.save();
                _formStateCadastro.currentState!.validate();

                if (_controller.isValidoCadastro) {
                    var res = await _controller.cadastrar();

                    if (res == null){
                        _toggleisLogin();
                    }
                    else{
                        showErr(context, res);
                    }
                }

                EasyLoading.dismiss();
            },
            icon: Icon(Icons.person_add),
            label: "Cadastrar-se",
        );
    }

    List<Widget> loginOuCadastro(BuildContext context) {
        if (_isLogin) {
            return [
                emailField(),
                passField(),
                loginButton(context),
                gotoCadastro(),
            ];
        } else {
            return [
                nameField(),
                emailField(),
                passField(),
                passRepeatField(),
                cadastroButton(),
            ];
        }
    }

    showErr(BuildContext context, msg){
        showDialog(
            context: context, 
            builder: (context) => AlertDialog(
                title: Text("Erro"),
                content: Text(msg),

            )
        );
    }

    @override
    Widget build(BuildContext context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AlertDialog(
                title: _isLogin
                    ? Text("Entrar na conta")
                    : Row(
                        children: [
                            IconButton(
                                onPressed: () => _toggleisLogin(),
                                icon: Icon(Icons.arrow_back),
                            ),
                            Spacer(),
                            Text("Cadastrar uma nova conta"),
                            Spacer(flex: 5),
                        ],
                    ),
                content: Container(
                    width: 500,
                    height: _isLogin ?  300 : 500,
                    child: Form(
                        key: _isLogin ? _formState : _formStateCadastro,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: loginOuCadastro(context),
                        ),
                    ),
                ),
            ),
        );
    }
}
