import 'package:flutter/material.dart';
import 'friends.dart';
import 'home.dart';
import 'journal.dart';
import 'settings.dart';

class CustomBottomBar extends StatefulWidget {
  final int index;

  const CustomBottomBar({Key key, this.index}) : super(key: key);
  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            ModalRoute.withName("/"));
        break;
      case 1:
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => JournalPage()),
            ModalRoute.withName("/"));
        break;
      case 2:
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => FriendsPage()),
            ModalRoute.withName("/"));
        break;
      case 3:
      default:
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
            ModalRoute.withName("/"));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex = this.widget.index;
    return Hero(
      tag: "bottomNav",
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
