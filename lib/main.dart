import 'package:flutter/material.dart';
import 'package:hcl_zgaf_ex_pr2/src/pages/MainPage.dart';
import 'package:hcl_zgaf_ex_pr2/src/routes/routes.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: new ThemeData(
          scaffoldBackgroundColor: Colors.blue[50],
        ),
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          print('Ruta ${settings.name}');
          return MaterialPageRoute(
              builder: (BuildContext context) => MainPage());
        });
  }
}
