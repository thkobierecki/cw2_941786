import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextButton(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
          foregroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
        ),
        onPressed: onClicked,
      );
}
