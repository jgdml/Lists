// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_modal_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginModalController on _LoginModalController, Store {
  final _$isLoginAtom = Atom(name: '_LoginModalController.isLogin');

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  final _$_LoginModalControllerActionController =
      ActionController(name: '_LoginModalController');

  @override
  dynamic toggleIsLogin() {
    final _$actionInfo = _$_LoginModalControllerActionController.startAction(
        name: '_LoginModalController.toggleIsLogin');
    try {
      return super.toggleIsLogin();
    } finally {
      _$_LoginModalControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin}
    ''';
  }
}
