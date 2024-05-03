import 'package:flutter/material.dart';


import '../../view/data/data_screen.dart';
import '../../view/home/form_screen.dart';
import 'page_route_builder.dart';
import 'routes.dart';

class RouteGenerator {
  RouteGenerator._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.formScreen:
        return DefaultPageRouteBuilder.defaultRoute(
        screen: const FormScreen(),
        );

      case AppRoutes.dataScreen:
        return DefaultPageRouteBuilder.animatedLeftDownRoute(
            screen: const DataScreen(),
            );
    
    }
    return MaterialPageRoute(
      builder: (context) => const Center(
        child: Text('Unknown Screen'),
      ),
    );
  }
}
