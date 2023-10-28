
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_and_flutter_app/data/service/service_todo.dart';
import 'package:firebase_and_flutter_app/model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceProvider = StateProvider<ToDoService>((ref)
{
return ToDoService();
});



final fetchStreamProvider = StreamProvider<List<ToDoModel>>((ref) async*
{
  final getData = FirebaseFirestore.instance
      .collection('TodoApp')
  .snapshots()
  .map((event) => event.docs.map((snapshot) => ToDoModel.fromSnapshot(snapshot)).toList());
  yield*  getData;
});