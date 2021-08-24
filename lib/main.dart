import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/view/config.dart';
import 'package:just_lists/view/create_list.dart';
import 'package:just_lists/view/list_viewer.dart';
import 'package:just_lists/view/lists.dart';
import 'package:just_lists/view/widget/base.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    runApp(JustLists());

}

class JustLists extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'JustLists',
            theme: ThemeData(
                primarySwatch: Colors.red,
            ),
            routes: {
                Constants.NAV_HOME: (context) => Base(Lists(isHome: true)),
                Constants.NAV_CREATE_LIST: (context) => Base(CreateList(), selected: 1),
                Constants.NAV_MY_LISTS: (context) => Base(Lists(isHome: false), selected: 2),
                Constants.NAV_LIST_VIEWER: (context) => Base(ListViewer()),
                Constants.NAV_CONFIG: (context) => Base(Config(), selected: 3)
            },
        );
    }
}
