import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:motel_app/ui/screens/FavoriteMotelsScreen.dart';
import 'package:motel_app/ui/screens/HomeScreen.dart';
import 'package:motel_app/ui/screens/MapScreen.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenChooser(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 40, color: Colors.lightBlueAccent.withOpacity(.05))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.blueGrey,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Theme.of(context).backgroundColor,
                tabs: [
                  GButton(
                    icon: LineIcons.hotel,
                    text: 'Moteles',
                    iconColor: Colors.grey[400],
                    textColor: Color.fromRGBO(0,140,128,1),
                    iconActiveColor: Color.fromRGBO(0,140,128,1),
                  ),
                  GButton(
                    icon: LineIcons.search,
                    iconColor: Colors.grey[400],
                    text: 'Buscar',
                    textColor: Color.fromRGBO(0,168,107,1),
                    iconActiveColor: Color.fromRGBO(0,168,107,1),
                    backgroundColor: Color.fromRGBO(246,254,246,1),
                  ),
                  GButton(
                    icon: LineIcons.heart_o,
                    iconColor: Colors.grey[400],
                    text: 'Favoritos',
                    textColor: Color.fromRGBO(178,34,34,1),
                    iconActiveColor: Color.fromRGBO(178,34,34,1),
                    backgroundColor: Color.fromRGBO(253,210,226,1),
                  ),
                  GButton(
                    icon: LineIcons.map,
                    iconColor: Colors.grey[400],
                    text: 'Mapa',
                    textColor: Color.fromRGBO(218,165,32,1),
                    iconActiveColor: Color.fromRGBO(218,165,32,1),
                    backgroundColor: Color.fromRGBO(255,240,206,1),
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }

  Widget _screenChooser(int index) {
    switch (index) {
      case 0:
        return HomeScreen();   
        break;
      case 1:
        
        break;
      case 2:
        return FavoriteMotelsScreen();   
        break;
      case 3:
        return MapScreen(); 
        break;  
    }
    return Container();
  }
}