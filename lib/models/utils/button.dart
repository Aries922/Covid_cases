import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function press;
  final String name;
  Button({@required this.press, this.name});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
                onPressed: press,
                child: Text("$name"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.black,
                  side: BorderSide(color: Colors.blue[50], ),
                ));
  }
}
