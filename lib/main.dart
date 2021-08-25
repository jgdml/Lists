import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:just_lists/constants.dart';
import 'package:just_lists/view/perfil.dart';
import 'package:just_lists/view/create_list.dart';
import 'package:just_lists/view/list_viewer.dart';
import 'package:just_lists/view/lists.dart';
import 'package:just_lists/view/widget/base.dart';
import 'package:url_strategy/url_strategy.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    
    setPathUrlStrategy();
    runApp(JustLists());


}

class JustLists extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.ring;

        return MaterialApp(
            title: 'JustLists',
            theme: ThemeData(
                primarySwatch: Colors.lightBlue,
            ),
            routes: {
                Constants.NAV_HOME: (context) => Base(Lists(isHome: true)),
                Constants.NAV_CREATE_LIST: (context) => Base(CreateList(), selected: 1),
                Constants.NAV_MY_LISTS: (context) => Base(Lists(isHome: false), selected: 2),
                Constants.NAV_LIST_VIEWER: (context) => Base(ListViewer()),
                Constants.NAV_PERFIL: (context) => Base(Perfil(), selected: 3)
            },

            builder: EasyLoading.init(),
        );
    }
}
