

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/utils.dart';
import '../models/todo_model.dart';

class TodoService{
  void addNotes({
    required String taskName,
    required String taskId,
    required String userID,
    required BuildContext context,
  }) async {
    try {
      final todoDetails = TodoModel(

        taskId: taskId,
        userId: userID,
        taskName: taskName ,
        isCompleted: false,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('todos')
          .doc(taskId)
          .set(todoDetails.toJson());
      if (!context.mounted) return;
      showSnackBar(context, "Task successfully added");
      //await getNotesForUser(userID: userID, context: context);
     // if (!context.mounted) return;
     // Navigator.pop(context);
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context, e.toString());
    }
  }
}