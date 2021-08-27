import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_lists/controller/list_viewer_controller.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/model/registro.dart';
import 'package:just_lists/view/widget/custom_button.dart';
import 'package:just_lists/view/widget/page_title.dart';

class ListViewer extends StatelessWidget {
    ListViewer({Key? key}) : super(key: key);

    List<DataColumn> _camposLista(List<Registro?> regs) {
        var campos = regs.map((reg) {
            return DataColumn(
                label: Text(
                    reg!.nome!,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                    ),
                ),
            );
        }).toList();

        campos.add(
            DataColumn(
                label: Text(
                    "Ações",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                    ),
                ),
            ),
        );

        return campos;
    }

    List<DataRow> _registrosLista(
            List<Registro?> regs, ListViewerController _controller) {
        var linhas = <DataRow>[];
        if (regs[0]!.valores != null) {
            for (int i = 0; i < regs[0]!.valores!.length; i++) {
                var celulas = <DataCell>[];
                for (int y = 0; y < regs.length; y++) {
                    celulas.add(DataCell(Text(regs[y]!.valores![i])));
                }
                celulas.add(
                    DataCell(
                        Row(
                            children: [
                                IconButton(
                                    onPressed: () => _controller.editReg(i),
                                    icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                    onPressed: () => _controller.deleteReg(i),
                                    icon: Icon(Icons.delete),
                                )
                            ],
                        ),
                    ),
                );

                linhas.add(DataRow(
                    cells: celulas,
                ));
            }
        }
        return linhas;
    }

    @override
    Widget build(BuildContext context) {
        var _controller = ListViewerController(context);

        return Scaffold(body: Center(
            child: Observer(builder: (context) {
                return FutureBuilder(
                    future: _controller.lista,
                    builder: (context, future) {
                        if (future.hasData) {
                            var lista = future.data as Lista;

                            return Column(
                                children: [
                                    Spacer(),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            PageTitle(texto: lista.titulo ?? ""),
                                            IconButton(
                                                onPressed: () => null,
                                                icon: Icon(Icons.info_outline),
                                            ),
                                        ],
                                    ),
                                    Spacer(),
                                    CustomButton(
                                        onPressed: () => null,
                                        icon: Icon(Icons.add),
                                        label: "Adicionar registro",
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Theme.of(context).primaryColor,
                                            ),
                                            borderRadius: BorderRadius.circular(5),
                                        ),
                                        width: double.infinity,
                                        margin: EdgeInsets.all(20),
                                        child: DataTable(
                                            headingRowColor: MaterialStateProperty.all<Color>(
                                                    Theme.of(context).primaryColor.withAlpha(20)),
                                            columns: _camposLista(lista.registros),
                                            rows: _registrosLista(lista.registros, _controller),
                                        ),
                                    ),
                                    Spacer(flex: 5),
                                ],
                            );
                        }
                        return Container();
                    },
                );
            }),
        ));
    }
}
