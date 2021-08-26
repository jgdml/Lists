import 'package:flutter/cupertino.dart';
import 'package:just_lists/domain/model/lista.dart';

class ListViewerController{

    
    late Lista lista;

    ListViewerController(BuildContext context){
        lista = ModalRoute.of(context)!.settings.arguments as Lista;
    }



}