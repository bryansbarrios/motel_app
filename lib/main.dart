import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'locator.dart';
import './ui/Router.dart';
import './core/viewmodels/viewmodels.dart';
 
void main() { 
  setupLocator();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MotelViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
        theme: ThemeData(),
      ),
    );
  }
}