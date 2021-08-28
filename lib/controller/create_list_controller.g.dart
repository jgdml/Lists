// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateListController on _CreateListController, Store {
  final _$listaAtom = Atom(name: '_CreateListController.lista');

  @override
  Lista? get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(Lista? value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$_CreateListControllerActionController =
      ActionController(name: '_CreateListController');

  @override
  dynamic switchPrivacy(bool val) {
    final _$actionInfo = _$_CreateListControllerActionController.startAction(
        name: '_CreateListController.switchPrivacy');
    try {
      return super.switchPrivacy(val);
    } finally {
      _$_CreateListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeRegType(int regPos, String val) {
    final _$actionInfo = _$_CreateListControllerActionController.startAction(
        name: '_CreateListController.changeRegType');
    try {
      return super.changeRegType(regPos, val);
    } finally {
      _$_CreateListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addReg() {
    final _$actionInfo = _$_CreateListControllerActionController.startAction(
        name: '_CreateListController.addReg');
    try {
      return super.addReg();
    } finally {
      _$_CreateListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeLastReg() {
    final _$actionInfo = _$_CreateListControllerActionController.startAction(
        name: '_CreateListController.removeLastReg');
    try {
      return super.removeLastReg();
    } finally {
      _$_CreateListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
