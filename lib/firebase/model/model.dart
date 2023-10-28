

import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoModel
{
  String? docID;
  final String titleTask;
  final String descriptionTask;
  final String dateTask;
  final String timeTask;
  final String categoryTask;
  final bool isDone;

  ToDoModel(
  {
    this.docID,
    required this.titleTask,
    required this.descriptionTask,
    required this.dateTask,
    required this.timeTask,
    required this.categoryTask,
    required this.isDone,
} );

  Map<String,dynamic> toMap()
  {
    return <String,dynamic>
    {
    "titleTask":titleTask,
    "descriptionTask":descriptionTask,
    "dateTask":dateTask,
    "timeTask":timeTask,
    "categoryTask":categoryTask,
    "isDone":isDone,
    };
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map)
  {
    return ToDoModel(
        docID: map['docID']  ,
        titleTask: map['titleTask'] ,
        descriptionTask:  map['descriptionTask'] ,
        dateTask:  map['dateTask'],
        timeTask:  map['timeTask'] ,
        categoryTask:  map['categoryTask'] ,
        isDone:  map['isDone'] ,
    );
  }


 factory ToDoModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
  {
    return ToDoModel(
    docID: doc.id,
    titleTask: doc['titleTask'],
    descriptionTask: doc['descriptionTask'],
    dateTask: doc['dateTask'],
    timeTask: doc['timeTask'],
    categoryTask: doc['categoryTask'],
    isDone: doc['isDone'],
  );
  }

}