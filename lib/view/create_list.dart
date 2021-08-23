import 'package:flutter/material.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/controller/create_list_controller.dart';
import 'package:just_lists/domain/model/registro.dart';
import 'package:just_lists/view/widget/custom_button.dart';
import 'package:just_lists/view/widget/decorated_container.dart';
import 'package:just_lists/view/widget/page_title.dart';

class CreateList extends StatefulWidget {
    const CreateList({Key? key}) : super(key: key);

    @override
    _CreateListState createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
    final _formState = GlobalKey<FormState>();

    var _controller = CreateListController();

    Widget titleField() {
        return TextFormField(
            onSaved: (val) => _controller.lista?.titulo = val,
            validator: _controller.validarTitulo,
            maxLength: 50,
            autofocus: true,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                labelText: "Título",
                hintText: "Lista número 1",
                border: OutlineInputBorder(),
            ),
        );
    }

    Widget privacyField() {
        return FittedBox(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text("Privacidade", style: TextStyle(fontSize: 18)),
                    Switch(
                        onChanged: (val) {
                            setState(() {
                                _controller.lista!.isPrivate = val;
                            });
                        },
                        value: _controller.lista!.isPrivate!,
                    ),
                    _controller.lista!.isPrivate!
                            ? Icon(Icons.lock_outline)
                            : Icon(Icons.lock_open),
                    Text(
                        "Lista " + (_controller.lista!.isPrivate! ? "privada" : "pública"),
                        style: TextStyle(fontSize: 16),
                    ),
                ],
            ),
        );
    }

    Widget campoField(int regPos) {

        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Text((regPos + 1).toString()),
                    Container(
                        width: 300,
                        child: TextFormField(
                            validator: _controller.validarRegistroNome,
                            onSaved: (val) =>
                                    _controller.lista!.registros[regPos]!.nome = val,
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                labelText: "Campo",
                                hintText: "Campo número 1",
                                border: OutlineInputBorder(),
                            ),
                        ),
                    ),
                    Container(
                        width: 300,
                      child: DropdownButtonFormField<String>(
                          items: Constants.TYPE_NAMES.map((var val) {
                              return DropdownMenuItem<String>(value: val, child: Text(val));
                          }).toList(),
                          validator: _controller.validarRegistroTipo,
                          value: _controller.lista!.registros[regPos]!.tipo,
                          onChanged: (typeVal) => setState(() {
                              _controller.lista!.registros[regPos]!.tipo = typeVal.toString();
                          }),
                          hint: Text('Selecione o tipo do campo'),
                          style: TextStyle(fontSize: 18),
                      ),
                    ),
                ],
            ),
        );
    }

    Widget addCampo() {
        return CustomButton(
            onPressed: () {
                setState(() {
                    _controller.lista!.registros.add(Registro());
                });
            },
            icon: Icon(Icons.add),
            label: "Adicionar um campo",
        );
    }

    Widget campos() {
        return FittedBox(
            child: Container(
                width: 800,
                height: 300,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 5,
                        color: Theme.of(context).primaryColor.withAlpha(20),
                    ),
                ),
                child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _controller.lista?.registros.length,
                        itemBuilder: (context, index) {
                            return campoField(index);
                        }),
            ),
        );
    }

    showError(String msg){
        return showDialog(
            context: context, 
            builder: (context) => AlertDialog(
                title: Text("Erro"),
                content: Text(msg),

            )
        );
    }

    Widget saveButton() {
        return CustomButton(
            onPressed: () {
                _formState.currentState!.validate();
                _formState.currentState!.save();

                var resErr = _controller.validarRegistros();
                if (resErr != null){
                    showError(resErr);
                }

                if (_controller.isValido) {
                    _controller.salvar();
                }
            },
            icon: Icon(Icons.save),
            label: "Salvar",
        );
    }

    Widget removeButton() {
        return CustomButton(
            onPressed: () => setState(() {
                try{
                    _controller.lista!.registros.removeLast();
                }
                catch (RangeError){}
            }),
            icon: Icon(Icons.delete),
            label: "Remover Campo",
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Column(
                    children: [
                        Spacer(),
                        PageTitle(texto: "Criar Lista"),
                        Spacer(flex: 5),
                        DecoratedContainer(
                            child: Form(
                                key: _formState,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                        titleField(),
                                        campos(),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                                addCampo(),
                                                removeButton(),
                                            ],
                                        ),
                                        Spacer(),
                                        privacyField(),
                                        Spacer(
                                            flex: 2,
                                        ),
                                        saveButton()
                                    ],
                                ),
                            ),
                        ),
                        Spacer(flex: 8),
                    ],
                ),
            ),
        );
    }
}
