import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/sidebar.dart';

class Base extends StatelessWidget {
    final Widget child;

    final int selected;

    const Base(this.child, {this.selected = 0});
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Row(
                children: [
                    Sidebar(selected: selected),
                    Expanded(child: child)
                ]
            ),
        );
    }
}