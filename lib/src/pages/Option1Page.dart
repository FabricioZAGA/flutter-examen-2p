import 'package:flutter/material.dart';
import 'package:extended_math/extended_math.dart';

class Option1Page extends StatefulWidget {
  @override
  _Option1PageState createState() => _Option1PageState();
}

class _Option1PageState extends State<Option1Page> {
  String result = '';
  int aValue = 0;
  int bValue = 0;
  int cValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecuación Cuadrática'),
        backgroundColor: Colors.teal[200],
      ),
      body: ListView(
        padding: EdgeInsets.all(25.0),
        children: <Widget>[
          _resultCard(),
          SizedBox(height: 20),
          _x1Input(),
          SizedBox(height: 20),
          _x2Input(),
          SizedBox(height: 20),
          _x3Input(),
          SizedBox(height: 50),
          _calculateButton(a: aValue, b: bValue, c: cValue),
          Divider(),
        ],
      ),
    );
  }

  Widget _x1Input() {
    return TextField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Ingresa el valor de A',
        labelText: 'A',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        setState(() {
          aValue = int.parse(val);
        });
      },
    );
  }

  Widget _x2Input() {
    return TextField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Ingresa el valor de B',
        labelText: 'B',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        setState(() {
          bValue = int.parse(val);
        });
      },
    );
  }

  Widget _x3Input() {
    return TextField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Ingresa el valor de C',
        labelText: 'C',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        setState(() {
          cValue = int.parse(val);
        });
      },
    );
  }

  Widget _calculateButton({a: 0, b: 0, c: 0}) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: () {
        try {
          final q = QuadraticEquation(a: a, b: b, c: c);
          setState(() {
            result = q.calculate().toString();
          });
        } catch (e) {
          setState(() {
            result = e.toString();
          });
        }
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
