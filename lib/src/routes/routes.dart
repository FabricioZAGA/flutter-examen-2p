import 'package:flutter/material.dart';
import 'package:hcl_zgaf_ex_pr2/src/pages/MainPage.dart';
import 'package:hcl_zgaf_ex_pr2/src/pages/OptionsPage.dart';
import 'package:hcl_zgaf_ex_pr2/src/pages/Option1Page.dart';
import 'package:hcl_zgaf_ex_pr2/src/pages/Option2Page.dart';
import 'package:hcl_zgaf_ex_pr2/src/pages/Option3Page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => MainPage(),
    'options': (BuildContext context) => OptionsPage(),
    'option1': (BuildContext context) => Option1Page(),
    'option2': (BuildContext context) => Option2Page(),
    'option3': (BuildContext context) => Option3Page()
  };
}
