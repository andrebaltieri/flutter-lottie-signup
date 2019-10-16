import 'package:flutter/material.dart';

import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  final bool busy;
  final Function func;

  SubmitForm({@required this.busy, @required this.func});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Usuário",
              labelStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ),
        LoadingButton(
          busy: busy,
          func: func,
        ),
      ],
    );
  }
}
