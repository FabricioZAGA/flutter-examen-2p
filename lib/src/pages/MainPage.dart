import 'package:flutter/material.dart';
import 'package:hcl_zgaf_ex_pr2/src/utils/MainData.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String nameValue = 'Desconocido';
  String ageValue = '100';
  String stateValue = 'Tlaxcala';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingresa tus datos'),
        backgroundColor: Colors.teal[200],
      ),
      body: ListView(
        padding: EdgeInsets.all(25.0),
        children: <Widget>[
          _nameInput(),
          SizedBox(height: 20),
          _ageInput(),
          SizedBox(height: 20),
          _stateInput(),
          SizedBox(height: 50),
          _enterButton(context),
          Divider(),
        ],
      ),
    );
  }

  Widget _nameInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Tu nombre aquí',
        labelText: 'Nombre',
        icon: Icon(Icons.person, size: 40),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        setState(() {
          nameValue = val.toString();
        });
      },
    );
  }

  Widget _ageInput() {
    return TextField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Edad',
        labelText: 'Edad',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        setState(() {
          ageValue = val.toString();
        });
      },
    );
  }

  Widget _stateInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Origen',
        labelText: 'Estado',
        helperText: 'Escribe tu estado de origen',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        setState(() {
          stateValue = val.toString();
        });
      },
    );
  }

  Widget _enterButton(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: () {
        Navigator.pushNamed(
          context,
          'options',
          arguments: MainData(nameValue, ageValue, stateValue),
        );
      },
      color: Colors.teal[200],
      elevation: 0,
      child: Text(
        "Entrar",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.teal[300], width: 1)),
    );
  }
}
