import 'package:flutter/material.dart';
import 'package:hcl_zgaf_ex_pr2/src/utils/MainData.dart';

class OptionsPage extends StatefulWidget {
  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    final MainData args = ModalRoute.of(context).settings.arguments as MainData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones'),
        backgroundColor: Colors.teal[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0),
              child:
                  _infoCard(name: args.name, age: args.age, state: args.state),
            ),
            SizedBox(height: 100),
            _button(text: "Opcion 1", color: 300, option: 1, context: context),
            SizedBox(height: 100),
            _button(text: "Opcion 2", color: 400, option: 2, context: context),
            SizedBox(height: 100),
            _button(text: "Opcion 3", color: 600, option: 3, context: context),
          ],
        ),
      ),
    );
  }
}

Widget _button({text, color, option, BuildContext context}) {
  return AnimatedContainer(
    width: 150,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.teal[color],
      shape: BoxShape.rectangle,
    ),
    duration: Duration(milliseconds: 300),
    curve: Curves.linearToEaseOut,
    child: MaterialButton(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        switch (option) {
          case 1:
            Navigator.pushNamed(context, 'option1');
            break;
          case 2:
            Navigator.pushNamed(context, 'option2');
            break;
          case 3:
            Navigator.pushNamed(context, 'option3');
            break;
        }
      },
    ),
  );
}

Widget _infoCard({name, age, state}) {
  return Container(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          'Hola $name, tienes $age y eres de $state',
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
