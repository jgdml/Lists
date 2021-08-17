import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/decorated_container.dart';
import 'package:just_lists/view/widget/page_title.dart';
import 'package:just_lists/view/widget/responsive_text.dart';

class CreateList extends StatefulWidget {
    const CreateList({ Key? key }) : super(key: key);

    @override
    _CreateListState createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
    final _formState = GlobalKey<FormState>();


    bool isPrivate = true;

    Widget titleField(){
        return TextFormField(
            maxLength: 50,
            
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                labelText: "Título",
                hintText: "Lista número 1",
                border: OutlineInputBorder()
            ),
        );
    }

    Widget privacyField(){
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
                    Text("Lista " + (isPrivate ? "privada" : "pública"), style: TextStyle(fontSize: 16))
                ],
            ),
        );
    }

    Widget typeField(){
        return FittedBox(
          child: DropdownButton(
              items: ['tipo 1 ', 'tipo2'].map((var val) {
                  return DropdownMenuItem(value: val, child: Text(val));
              }).toList(),
              onChanged: (a) => null,
              hint: Text('Selecione o tipo da lista'),
              style: TextStyle(fontSize: 18),
          ),
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
                                    children: [
                                        titleField(),

                                        Spacer(),

                                        privacyField(),

                                        Spacer(),

                                        typeField(),

                                        Spacer(flex: 2)
                                    ],
                                ),
                            ),
                        ),

                        Spacer(flex: 8),
                    ],  
                )
            ),
        );
    }
}
