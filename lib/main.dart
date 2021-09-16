import 'package:flutter/material.dart';

import 'auth/Authentication.dart';
import 'screens/SplashScreen.dart';
import 'utils/Mapping.dart';

void main() {
  runApp(new App());
}

class App extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/Manager': (BuildContext context) => MappingPage(auth: Auth()),
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App",
      theme: new ThemeData(
      ),
      home: SplashScreen(nextRoute: '/Manager'),
      routes: routes,
    );
  }
}
