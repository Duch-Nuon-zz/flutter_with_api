import 'package:flutter/material.dart';

import 'route/route_app.dart';

void main() => runApp(AppIndex());

class AppIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
