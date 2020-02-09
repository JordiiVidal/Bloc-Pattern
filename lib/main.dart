import 'package:bloc_pattern/bloc/provider.dart';
import 'package:bloc_pattern/pages/home_page.dart';
import 'package:bloc_pattern/pages/login_page.dart';
import 'package:bloc_pattern/widget/status_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Provider(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color.fromRGBO(63, 63, 156, 1.0),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
