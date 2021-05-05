import 'package:flutter/material.dart';

class Option2Page extends StatefulWidget {
  @override
  _Option2PageState createState() => _Option2PageState();
}

class _Option2PageState extends State<Option2Page> {
  String result = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organizar tu nombre'),
        backgroundColor: Colors.teal[200],
      ),
      body: ListView(
        padding: EdgeInsets.all(25.0),
        children: <Widget>[
          _resultCard(),
          SizedBox(height: 20),
          _nameInput(),
          SizedBox(height: 50),
          _calculateButton(name: name),
          Divider(),
        ],
      ),
    );
  }

  Widget _nameInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Ingresa aquí tu nombre',
        labelText: 'Nombre',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        setState(() {
          name = val.toString();
          print(name);
        });
      },
    );
  }

  Widget _calculateButton({name}) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: () {
        name = name.toLowerCase();
        List letters = [];
        String aux = '';
        for (int i = 0; i < name.length; i++) {
          letters.add(name[i]);
        }
        letters.sort();
        for (int i = 0; i < letters.length; i++) {
          aux += letters[i];
        }
        setState(() {
          result = aux;
        });
      },
      color: Colors.teal[200],
      elevation: 0,
      child: Text(
        "Calcular",
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

  Widget _resultCard() {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            'Resultado: $result',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.9),
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.grey,
        //     blurRadius: 10,
        //     spreadRadius: 5,
        //     offset: Offset(0, 10.0),
        //   )
        // ],
      ),
    );
  }
}
