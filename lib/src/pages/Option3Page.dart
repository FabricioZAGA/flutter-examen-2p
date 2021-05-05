import 'package:flutter/material.dart';
import 'dart:math';

class Option3Page extends StatefulWidget {
  @override
  _Option3PageState createState() => _Option3PageState();
}

class _Option3PageState extends State<Option3Page> {
  int result = 0;
  int minValue = 0;
  int maxValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Números Random'),
        backgroundColor: Colors.teal[200],
      ),
      body: ListView(
        padding: EdgeInsets.all(25.0),
        children: <Widget>[
          _resultCard(),
          SizedBox(height: 20),
          _minInput(),
          SizedBox(height: 20),
          _maxInput(),
          SizedBox(height: 50),
          _calculateButton(minValue: minValue, maxValue: maxValue),
          Divider(),
        ],
      ),
    );
  }

  Widget _minInput() {
    return TextField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Ingresa el valor mínimo',
        labelText: 'Mínimo',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        setState(() {
          minValue = int.parse(val);
        });
      },
    );
  }

  Widget _maxInput() {
    return TextField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Ingresa el valor máximo',
        labelText: 'Máximo',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        setState(() {
          maxValue = int.parse(val);
        });
      },
    );
  }

  Widget _calculateButton({minValue, maxValue}) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: () {
        try {
          Random rnd = new Random();
          int r;
          rnd = new Random();
          r = minValue + rnd.nextInt(maxValue - minValue);
          setState(() {
            result = r;
          });
        } catch (e) {
          setState(() {
            result = 0;
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
