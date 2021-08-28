// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_viewer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListViewerController on _ListViewerController, Store {
  final _$listaAtom = Atom(name: '_ListViewerController.lista');

  @override
  Future<Lista>? get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(Future<Lista>? value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
