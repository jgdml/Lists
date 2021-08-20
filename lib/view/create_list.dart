import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/custom_button.dart';
import 'package:just_lists/view/widget/decorated_container.dart';
import 'package:just_lists/view/widget/page_title.dart';
import 'package:just_lists/view/widget/responsive_text.dart';

class CreateList extends StatefulWidget {
    const CreateList({Key? key}) : super(key: key);

    @override
    _CreateListState createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
    final _formState = GlobalKey<FormState>();

    bool isPrivate = true;

    Widget titleField() {
        return TextFormField(
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
                                isPrivate = val;
                            });
                        },
                        value: isPrivate,
                    ),
                    isPrivate ? Icon(Icons.lock_outline) : Icon(Icons.lock_open),
                    Text(
                        "Lista " + (isPrivate ? "privada" : "pública"),
                        style: TextStyle(fontSize: 16),
                    ),
                ],
            ),
        );
    }

    Widget campoField() {
        var tipos = ['Texto', 'Número', 'Preço', 'Checkmark'];

        return FittedBox(
            child: Container(
                width: 700,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 5,
                        color: Theme.of(context).primaryColor.withAlpha(20),
                    ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                            width: 300,
                            child: TextFormField(
                                style: TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                    labelText: "Campo",
                                    hintText: "Campo número 1",
                                    border: OutlineInputBorder(),
                                ),
                            ),
                        ),
                        DropdownButton(
                            items: tipos.map((var val) {
                                return DropdownMenuItem(value: val, child: Text(val));
                            }).toList(),
                            onChanged: (a) => null,
                            hint: Text('Selecione o tipo da lista'),
                            style: TextStyle(fontSize: 18),
                        ),
                    ],
                ),
            ),
        );
    }

    Widget addCampo() {
        return CustomButton(
            onPressed: () => null,
            icon: Icon(Icons.add),
            label: "Adicionar um campo",
        );
    }

    Widget campos() {
        return Column(
            children: [
                campoField(),
                addCampo(),
            ],
        );
    }

    Widget saveButton() {
        return CustomButton(
            onPressed: () => null,
            icon: Icon(Icons.save),
            label: "Salvar",
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
