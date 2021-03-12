import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State{
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10.0), child: new Form(key: _formKey, child: new Column(children: <Widget>[
      new Text('Имя пользователя:', style: TextStyle(fontSize: 20.0),),
      new TextFormField(validator: (value){
        if (value.isEmpty) return 'Пожалуйста введите свое имя';
      }),

      new SizedBox(height: 20.0),

      new Text('Контактный E-mail:', style: TextStyle(fontSize: 20.0),),
      new TextFormField(validator: (value){
        if (value.isEmpty) return 'Пожалуйста введите свой Email';

        String p = "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
        RegExp regExp = new RegExp(p);

        if (regExp.hasMatch(value)) return null;

        return 'Это не E-mail';
      }),

      new SizedBox(height: 20.0),

      new RaisedButton(onPressed: (){
        if(_formKey.currentState.validate()) Scaffold.of(context).showSnackBar(SnackBar(content: Text('Форма успешно заполнена'), backgroundColor: Colors.green,));
      }, child: Text('Проверить'), color: Colors.blue, textColor: Colors.white,),
    ],)));
  }
}

void main() => runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(title: new Text('Flutter.su - Форма ввода')),
            body: new MyForm()
        )
    )
);