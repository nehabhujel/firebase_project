import 'package:firebase_project/model/note_model.dart';

import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  List<NoteModel> _noteModel = [];
  List<NoteModel> get noteModel => _noteModel;
  void setNote(String noteModel) {
    _noteModel = noteModelFromJson(noteModel);
    notifyListeners();
  }

  void setNoteFromModel(List<NoteModel> noteModel) {
    _noteModel = noteModel;
    notifyListeners();
  }
}
