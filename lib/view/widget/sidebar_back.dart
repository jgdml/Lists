import 'package:flutter/cupertino.dart';
import 'package:just_lists/constants.dart';

class SidebarBack{

    goToHome(BuildContext context){
        Navigator.of(context).pushReplacementNamed(Constants.NAV_HOME);
    }

    goToMyLists(BuildContext context){
        Navigator.of(context).pushReplacementNamed(Constants.NAV_MY_LISTS);
    }

    goToCreateList(BuildContext context){
        Navigator.of(context).pushReplacementNamed(Constants.NAV_CREATE_LIST);
    }
    
    goToConfig(BuildContext context){
        Navigator.of(context).pushReplacementNamed(Constants.NAV_CONFIG);
    }

}