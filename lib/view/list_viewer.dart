import 'package:flutter/material.dart';
import 'package:just_lists/controller/list_viewer_controller.dart';
import 'package:just_lists/domain/model/registro.dart';
import 'package:just_lists/view/widget/page_title.dart';

class ListViewer extends StatelessWidget {
    ListViewer({Key? key}) : super(key: key);

    List<DataColumn> _camposLista(List<Registro?> regs) {
        return regs.map((reg) {
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
    }

    List<DataCell>? _valoresLista(List<dynamic> valores) {
        return valores.map<DataCell>((val) {
            return DataCell(
                Text(val),
            );
        }).toList();
    }

    List<DataRow> _registrosLista(List<Registro?> regs) {
        if (regs[0]!.valores != null) {
            return regs.map<DataRow>((reg) {
                return DataRow(
                    cells: _valoresLista(reg?.valores ?? []) ?? [],
                );
            }).toList();
        } else {
            return <DataRow>[];
        }
    }

    @override
    Widget build(BuildContext context) {
        var _controller = ListViewerController(context);

        return Scaffold(
            body: Center(
                child: Column(
                    children: [
                        Spacer(),
                        PageTitle(texto: _controller.lista.titulo!),
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                ),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            width: double.infinity,
                            margin: EdgeInsets.all(20),
                            child: DataTable(
                                headingRowColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor.withAlpha(20)),
                                dividerThickness: 2,
                                columns: _camposLista(_controller.lista.registros),
                                rows: _registrosLista(_controller.lista.registros),
                            ),
                        ),
                        Spacer(flex: 5),
                    ],
                ),
            ),
        );
    }
}
