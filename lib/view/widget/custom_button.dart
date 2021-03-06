import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
    const CustomButton(
            {Key? key,
            required this.onPressed,
            required this.icon,
            required this.label})
            : super(key: key);

    final Function()? onPressed;
    final Widget icon;
    final String label;

    @override
    Widget build(BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height*0.05,
            child: FittedBox(
              child: ElevatedButton.icon(
                  onPressed: onPressed,
                  icon: icon,
                  label: Text(
                      label,
                      style: TextStyle(
                          fontSize: 18,
                      ),
                  ),
                  style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(5)),
              ),
            ),
        );
    }
}
