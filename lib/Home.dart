import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _nome = "JAM";
  TextEditingController _nomeController = TextEditingController();

  void _salvar() async {
    String valorDigitado = _nomeController.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("Nome", valorDigitado);
  }

  void _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _nome = prefs.getString("Nome");
    });
  }

  void _remover() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(_nome),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Digite algo"),
              controller: _nomeController,
            ),
            Row(
              children: [
                RaisedButton(
                  onPressed: _salvar,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text("Salvar"),
                ),
                RaisedButton(
                  onPressed: _recuperar,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text("Recuperar"),
                ),
                RaisedButton(
                  onPressed: _remover,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text("Remover"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
