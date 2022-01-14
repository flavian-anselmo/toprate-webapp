import 'package:flutter/material.dart';
import 'package:topratepppp/screens/dashboard/home.dart';
import 'package:topratepppp/screens/dashboard/module.dart';
import 'package:topratepppp/screens/modules/Assignments/submit.dart';
import 'package:topratepppp/widgets/drawer.dart';

class DashboardScreen extends StatefulWidget {
  static const id = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    //screens to be viewed
    Home(),
    Modules(),
    // Profile(),
    SubmitAssignment(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toprate'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: const NavigationDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Modules',
          ),
         
         BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Submit Assignment',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
