import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_lists/controller/list_viewer_controller.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/model/registro.dart';
import 'package:just_lists/view/widget/create_registro_modal.dart';
import 'package:just_lists/view/widget/custom_button.dart';
import 'package:just_lists/view/widget/page_title.dart';

class ListViewer extends StatelessWidget {
    ListViewer({Key? key}) : super(key: key);

    List<DataColumn> _camposLista(List<Registro?> regs, bool isAuthor) {
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

        if (isAuthor) {
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
        }

        return campos;
    }

    DataCell _deleteEditButtons(lista, context, _controller, index) {
        return DataCell(
            Row(
                children: [
                    IconButton(
                        onPressed: () async {
                            await showDialog(
                                context: context,
                                builder: (context) =>
                                        CreateRegistroModal(lista, editMode: true),
                            );
                            _controller.atualizarLista();
                        },
                        icon: Icon(Icons.edit),
                    ),
                    IconButton(
                        onPressed: () async {
                            await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    title: Text("Excluir Registro"),
                                    content: Text("Deseja excluir esse registro?"),
                                    actions: [
                                        TextButton(
                                            onPressed: () => Navigator.of(context).pop(),
                                            child: Text("NÃO"),
                                        ),
                                        TextButton(
                                            onPressed: () => {
                                                _controller.deleteReg(index),
                                                Navigator.of(context).pop(),
                                            },
                                            child: Text("SIM"),
                                        ),
                                    ],
                                ),
                            );
                            _controller.atualizarLista();
                        },
                        icon: Icon(Icons.delete),
                    )
                ],
            ),
        );
    }

    List<DataRow> _registrosLista(
            Lista lista, ListViewerController _controller, context, bool isAuthor) {
        var regs = lista.registros;
        var linhas = <DataRow>[];
        if (regs[0]!.valores != null) {
            for (int i = 0; i < regs[0]!.valores!.length; i++) {
                var celulas = <DataCell>[];
                for (int y = 0; y < regs.length; y++) {
                    celulas.add(DataCell(Text(regs[y]!.valores![i])));
                }

                if (isAuthor) {
                    celulas.add(_deleteEditButtons(lista, context, _controller, i));
                }

                linhas.add(DataRow(
                    cells: celulas,
                ));
            }
        }
        return linhas;
    }

    Widget _privacidadeIndicator(bool isPrivate) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                    "Privacidade: ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                    ),
                ),
                isPrivate ? Icon(Icons.lock_outline) : Icon(Icons.lock_open),
                Text(
                    isPrivate ? "Privada" : "Pública",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                    ),
                ),
            ],
        );
    }

    _showListInfo(BuildContext context, Lista lista, _controller, bool isAuthor) {
        showDialog(
            context: context,
            builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    AlertDialog(
                        title: Text(
                            "Detalhes",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        content: Container(
                            height: 150,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                    Text(
                                        "Titulo: " + lista.titulo!,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                    Text(
                                        "Criado por: " + lista.usuario.nome!,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                    _privacidadeIndicator(lista.isPrivate!),
                                    isAuthor
                                            ? CustomButton(
                                                    onPressed: () => showDialog(
                                                        context: context,
                                                        builder: (context) => AlertDialog(
                                                            title: Text("Excluir Lista"),
                                                            content: Text(
                                                                    "Tem certeza que deseja excluir essa lista?"),
                                                            actions: [
                                                                TextButton(
                                                                    onPressed: () => Navigator.of(context).pop(),
                                                                    child: Text("NÃO"),
                                                                ),
                                                                TextButton(
                                                                    onPressed: () =>
                                                                            _controller.excluirLista(lista.id),
                                                                    child: Text("SIM"),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                    icon: Icon(Icons.delete),
                                                    label: "Excluir lista",
                                                )
                                            : Container()
                                ],
                            ),
                        ),
                    ),
                ],
            ),
        );
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
                            bool isAuthor = _controller.userId == lista.usuario.id;

                            if (!isAuthor && lista.isPrivate!) {
                                return Text(
                                    "Esta lista é privada, somente o dono pode acessá-la.",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                    ),
                                );
                            }

                            return Column(
                                children: [
                                    Spacer(),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            PageTitle(texto: lista.titulo ?? ""),
                                            IconButton(
                                                onPressed: () => _showListInfo(
                                                        context, lista, _controller, isAuthor),
                                                icon: Icon(Icons.info_outline),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                    Clipboard.setData(ClipboardData(
                                                            text: Uri.base.toString() + "?id=" + lista.id!));
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(content: Text("Link copiado!")));
                                                },
                                                icon: Icon(Icons.share),
                                            )
                                        ],
                                    ),
                                    Spacer(),
                                    isAuthor
                                            ? CustomButton(
                                                    onPressed: () async {
                                                        await showDialog(
                                                            context: context,
                                                            builder: (context) => CreateRegistroModal(lista),
                                                        );
                                                        _controller.atualizarLista();
                                                    },
                                                    icon: Icon(Icons.add),
                                                    label: "Adicionar registro",
                                                )
                                            : Container(),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Theme.of(context).primaryColor),
                                            borderRadius: BorderRadius.circular(5),
                                        ),
                                        width: double.infinity,
                                        margin: EdgeInsets.all(20),
                                        child: DataTable(
                                            headingRowColor: MaterialStateProperty.all<Color>(
                                                    Theme.of(context).primaryColor.withAlpha(20)),
                                            columns: _camposLista(lista.registros, isAuthor),
                                            rows: _registrosLista(
                                                    lista, _controller, context, isAuthor),
                                        ),
                                    ),
                                    Spacer(flex: 5),
                                ],
                            );
                        } else if (future.connectionState != ConnectionState.done) {
                            return Center(
                                child: CircularProgressIndicator(),
                            );
                        } 
                        
                        return Center(
                            child: Text(
                                "Ocorreu um erro ao buscar a lista",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        );
                    },
                );
            }),
        ));
    }
}
