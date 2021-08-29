import 'package:flutter_test/flutter_test.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/model/registro.dart';
import 'package:just_lists/domain/model/usuario.dart';

void main() {
    final lista = Lista(
        id: "asd",
        titulo: "Compras",
        isPrivate: true,
        usuario: Usuario(id: "xyz", nome: "usuarioNome"),
        registros: <Registro>[
            Registro(
                nome: "Nome",
                tipo: "Texto",
                valores: ["item 1", "item 2"],
            ),
            Registro(
                nome: "Categoria",
                tipo: "Texto",
                valores: ["Categoria 1", "Categoria 2"],
            ),
            Registro(
                nome: "Quantidade",
                tipo: "Número",
                valores: ["1", "2"],
            ),
            Registro(
                nome: "Custo",
                tipo: "Preço",
                valores: ["2.50", "9,90"],
            ),
        ],
    );

    group("Campo Obrigatórios", () {
        test("Campos da lista", () {
            expect(lista.id, allOf(isNotNull, isNotEmpty));
            expect(lista.titulo, allOf(isNotNull, isNotEmpty));
            expect(lista.isPrivate, isNotNull);
        });

        test("Campos de registros", () {
            expect(lista.registros, allOf(isNotNull, isNotEmpty));
            expect(lista.registros.first?.nome, allOf(isNotNull, isNotEmpty));
            expect(lista.registros.first?.tipo, allOf(isNotNull, isNotEmpty));
        });

        test("Campos do usuario", () {
            expect(lista.usuario.id, allOf(isNotNull, isNotEmpty));
            expect(lista.usuario.nome, allOf(isNotNull, isNotEmpty));

            expect(lista.usuario.id, allOf(isNotNull, isNotEmpty));
            expect(lista.usuario.nome, allOf(isNotNull, isNotEmpty));
        });
    });


    group("Tipos dos registros estão na lista de tipos", (){
        lista.registros.asMap().forEach((index, registro) {
            test("Registro "+index.toString(), () {
                expect(registro!.tipo, isIn(Constants.TYPE_NAMES));
            });
        });
    });


    group("Completude dos registros", () {
        lista.registros.asMap().forEach((index, registro) {
            test("Registro " + index.toString(), () {
                int nextIndex =
                        (index != lista.registros.length - 1) ? index + 1 : index;
                expect(registro!.valores!.length,
                        equals(lista.registros[nextIndex]!.valores!.length));
            });
        });
    });

    group("Valores correspondentes aos tipos", () {
        lista.registros.asMap().forEach((index, registro) {
            test("Registro " + index.toString(), () {
                registro?.valores?.forEach((valor) {
                    if (registro.tipo == Constants.TYPE_NAMES[Constants.TYPE_INT]) {
                        expect(() => int.parse(valor), returnsNormally);
                    } else if (registro.tipo ==
                            Constants.TYPE_NAMES[Constants.TYPE_DOUBLE]) {
                        valor = valor.toString().replaceAll(",", ".");
                        expect(() => double.parse(valor), returnsNormally);
                    }
                });
            });
        });
    });
}
