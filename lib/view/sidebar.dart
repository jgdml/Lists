import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:just_lists/view/components/list_button.dart';

class Sidebar extends StatelessWidget {
    const Sidebar({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        var screenW = MediaQuery.of(context).size.width;
        var screenH = MediaQuery.of(context).size.height;

        return Container(
            color: Colors.grey.shade900,
            padding: EdgeInsets.only(left: screenW*0.03, right: screenW*0.03),
            child: Column(
                children: <Widget>[

                    SizedBox(height: screenH*0.03),

                    Image(
                        image: AssetImage('assets/logo.png'),
                        width: screenW*0.1,
                    ),

                    SizedBox(height: screenH*0.03),

                    ListButton(
                        texto: Text("Nova lista"), 
                        icone: Icon(Icons.add), 
                        func: () => null
                    ),

                    Container(
                        width: 200,
                        height: screenH*0.7,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: AlwaysScrollableScrollPhysics(),

                            itemCount: 50,
                            itemBuilder: (BuildContext context, int index){
                                return ListButton(
                                    texto: Text("Lista "+(index+1).toString()), 
                                    icone: Icon(Icons.list), 
                                    func: () => print(index.toString())
                                );
                            }
                        ),
                    ),
                
                    ListButton(
                        texto: Text("Configurações"), 
                        icone: Icon(Icons.settings), 
                        func: () => null
                    ),
                ],
            ),
        );
    }
}