import 'package:flutter/material.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/view/config.dart';
import 'package:just_lists/view/create_list.dart';
import 'package:just_lists/view/home.dart';
import 'package:just_lists/view/my_lists.dart';
import 'package:just_lists/view/widget/base.dart';

void main() {
    runApp(JustLists());
}

class JustLists extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'JustLists',

            theme: ThemeData(
                primarySwatch: Colors.lightBlue,
            ),

            routes: {
                Constants.NAV_HOME: (context) => Base(Home()),

                Constants.NAV_CREATE_LIST: (context) => Base(CreateList(), selected: 1),
                Constants.NAV_MY_LISTS: (context) => Base(MyLists(), selected: 2),

                Constants.NAV_CONFIG: (context) => Base(Config(), selected: 3)
            }
        );
    }   
}