import 'package:flutter/material.dart';
import 'package:just_lists/view/widget/sidebar.dart';

class Base extends StatelessWidget {
    final Widget child;

    const Base(this.child);
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Row(
                children: [
                    Sidebar(),
                    Expanded(child: child)
                ]
            ),
        );
    }
}