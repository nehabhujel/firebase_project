
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/common/common_button.dart';
import 'package:firebase_project/common/common_textfield.dart';
import 'package:firebase_project/todo/services/todo_service.dart';
import 'package:firebase_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TodoScreenState extends StatefulWidget {
  const TodoScreenState({super.key});

  @override
  State<TodoScreenState> createState() => _TodoScreenStateState();
}

class _TodoScreenStateState extends State<TodoScreenState> {
  final TextEditingController taskController = TextEditingController();
  final TodoService _todoService = TodoService();
  final taskId = Uuid().v1();

  void addTask(){
   if(taskController.text.isEmpty){
     showSnackBar(context, "Please enter task name");
  }else{
  _todoService.addNotes(taskName: taskController.text,
  taskId: taskId,
  userID: FirebaseAuth.instance.currentUser!.uid,
  context: context
  );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CommonTextField(controller: taskController,
                hintText: "Please enter yoour task",
                icon: Icons.calendar_month_outlined),
            const SizedBox(
              height: 15,
            ),
            CommonbButton(onTap: () => addTask, text: "Add Task"),
          ],
        ),
      ),
    );
  }
}
