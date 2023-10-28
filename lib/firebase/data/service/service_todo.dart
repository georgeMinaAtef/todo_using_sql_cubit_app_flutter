
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_and_flutter_app/model/model.dart';

class ToDoService
{
  final todoCollection = FirebaseFirestore.instance.collection('TodoApp');


  void addNewTask(ToDoModel model)
  {
    todoCollection.add(model.toMap());
  }


  void updateTask(String? docID, bool? valueUpdate)
  {
    todoCollection.doc(docID).update({'isDone': valueUpdate});
  }

  void deleteTask(String? docID)
  {
    todoCollection.doc(docID).delete();
  }
}