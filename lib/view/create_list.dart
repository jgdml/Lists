import 'package:flutter/material.dart';
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
                hintText: "Lista número 1"
            ),
        );
    }

    Widget privacyField(){
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ResponsiveText("Privacidade"),
                Switch(
                    onChanged: (val) {
                        setState(() {
                            isPrivate = val;
                        });
                    },
                    value: isPrivate,
                ),
                isPrivate ? Icon(Icons.lock_outline) : Icon(Icons.lock_open),
                ResponsiveText("Lista " + (isPrivate ? "privada" : "pública"))
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        var sizeW = MediaQuery.of(context).size.width * 0.4;
        

        return Scaffold(
            body: Center(
                child: Column(
                    children: [

                        Spacer(),

                        PageTitle(texto: "Criar Lista"),

                        Spacer(flex: 5),

                        Container(
                            width: sizeW,
                            
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(2, 2))]
                            ),
                            padding: EdgeInsets.all(80),
                            
                            child: Form(
                                key: _formState,
                                child: Column(
                                    children: [
                                        titleField(),
                                        privacyField(),
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
