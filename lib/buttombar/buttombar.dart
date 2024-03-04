import 'package:firebase_project/auth/screen/login_screen.dart';
import 'package:firebase_project/auth/screen/signup_screen.dart';
import 'package:firebase_project/notes/screen/view_note.dart';
import 'package:firebase_project/todo/screen/todo_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/bottom-bar";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  List<Widget> pages = [
    const TodoScreenState(),
    const LoginPage(),
    const SignUp(),

    //const HomeScreen(),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.amber,
        selectedIndex: _page,
        elevation: 10,
        onDestinationSelected: updatePage,
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: '  favorite',
            icon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            label: '',
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
