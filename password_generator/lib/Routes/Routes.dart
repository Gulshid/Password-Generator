import 'package:flutter/material.dart';
import 'package:password_generator/Routes/RoutesName.dart';
import 'package:password_generator/View_/home_view.dart';

class Routes {
  static Route<dynamic> generate_Route(RouteSettings pass) {
    switch (pass.name) {
      case Routesname.home:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => HomeView(),
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder:
                (_) => Scaffold(body: Center(child: Text('No route here'))),
          );
        }
    }
  }
}
