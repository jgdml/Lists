import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/page_title.dart';

class CreateList extends StatefulWidget {
    const CreateList({ Key? key }) : super(key: key);

    @override
    _CreateListState createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
    
    final _formState = GlobalKey<FormState>();


    Widget titleField(){
        return TextFormField(

            autofocus: true,
            maxLength: 20,

            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                labelText: "Título",
                hintText: "Lista 1"
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

                        Container(
                            width: 250,
                            child: Form(
                                key: _formState,
                                child: Column(
                                    children: [
                                        titleField()
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
