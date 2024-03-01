import 'package:firebase_project/auth/screen/login_screen.dart';
import 'package:firebase_project/auth/screen/signup_screen.dart';
import 'package:firebase_project/buttombar/buttombar.dart';
import 'package:firebase_project/notes/screen/add_note.dart';
import 'package:firebase_project/notes/screen/edit_note.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const LoginPage());
    case SignUp.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUp(),
      );
    case AddNoteScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddNoteScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BottomBar());
    case NoteEditScreen.routeName:
      final argument = routeSettings.arguments as Map<String, dynamic>;
      final noteDescription = argument["noteDescription"];
      final noteId = argument["noteId"];
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => NoteEditScreen(
                noteDescription: noteDescription,
                noteId: noteId,
              ));
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen Doesnot Exist"),
          ),
        ),
      );
  }
}
