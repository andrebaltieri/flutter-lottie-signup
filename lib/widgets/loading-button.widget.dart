import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final bool busy;
  final Function func;

  LoadingButton({@required this.busy, @required this.func});

  @override
  Widget build(BuildContext context) {
    return !busy
        ? FlatButton(
            color: Color(0xFFC767E7),
            child: Text(
              "CADASTRAR",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: func,
          )
        : CircularProgressIndicator();
  }
}
