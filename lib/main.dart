import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motel_app/core/viewmodels/UserViewModel.dart';
import 'package:motel_app/ui/screens/SplashScreen.dart';
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
        ChangeNotifierProvider(create: (_) => MotelViewModel()),
        ChangeNotifierProvider(create: (_) => MotelTypeViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.generateRoute,
        home: SplashScreen(),
        theme: ThemeData(
          backgroundColor: Color.fromRGBO(245,250,255,1),
          hintColor: Color.fromRGBO(248,249,253,1),
          textTheme: GoogleFonts.googleSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}