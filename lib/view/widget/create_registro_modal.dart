import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:just_lists/view/widget/custom_button.dart';
import 'package:just_lists/view/widget/widget_controller/create_registro_modal_controller.dart';

class CreateRegistroModal extends StatelessWidget {
    final _formState = GlobalKey<FormState>();
    late final CreateRegistroModalController _controller;
    final editMode;

    CreateRegistroModal(lista, {this.editMode=false}) {
        _controller = CreateRegistroModalController(lista, editMode);
    }

    Widget makeField(int index) {
        return Container(
            width: 300,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
                initialValue: _controller.getStartingValueFrom(index),
                onSaved: (val) => _controller.addValOn(index, val!),
                validator: (val) {
                    var validator = _controller.getValidator(index);

                    return validator(val, index);
                },
                maxLength: 50,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    labelText: _controller.lista.registros[index]!.nome,
                    border: OutlineInputBorder(),
                ),
            ),
        );
    }

    List<Widget> formFields() {
        var fields = <Widget>[];

        for (int i = 0; i < _controller.lista.registros.length; i++) {
            fields.add(makeField(i));
        }

        return fields;
    }

    Widget saveButton(context) {
        return CustomButton(
            icon: editMode ? Icon(Icons.edit) : Icon(Icons.save),
            onPressed: () async {
                EasyLoading.show();

                _formState.currentState!.validate();
                _formState.currentState!.save();

                if (_controller.isAllValido){
                    await _controller.salvar();
                    Navigator.of(context).pop();
                }

                EasyLoading.dismiss();
            },
            label: editMode ? "Atualizar" : "Adicionar",
        );
    }

    @override
    Widget build(BuildContext context) {
        return AlertDialog(
            title: Text("Novo Registro"),
            content: Container(
                height: 250,

                child: Form(
                    key: _formState,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            SingleChildScrollView(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: formFields(),
                              ),
                            ),
                            saveButton(context),
                        ],
                    ),
                ),
            ),
        );
    }
}
