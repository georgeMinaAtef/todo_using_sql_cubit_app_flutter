
import 'package:firebase_and_flutter_app/data/provider/serivce_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CartToDoWidget extends ConsumerWidget {
  const CartToDoWidget({super.key, required this.getIndex});

  final int getIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todoData = ref.watch(fetchStreamProvider);

    return todoData.when(
        data: (todoData)
        {
          final getCategory = todoData[getIndex].categoryTask;
           Color categoryColor = Colors.white;

          switch(getCategory)
          {
            case 'Learning': categoryColor = Colors.green; break;
            case 'Working': categoryColor = Colors.blue.shade700; break;
            case 'General': categoryColor = Colors.amber.shade700; break;
          }
          return  Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: categoryColor,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Row(
              children: [
                Container(
                  width: 20,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      )
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        ListTile(
                          leading: IconButton(
                            icon: const Icon(CupertinoIcons.delete),
                            onPressed: ()
                            {
                              ref.read(serviceProvider).deleteTask( todoData[getIndex].docID);
                            },
                          ),
                          title:  Text(
                            todoData[getIndex].timeTask, maxLines: 1,
                            style: TextStyle(
                              decoration:  todoData[getIndex].isDone ? TextDecoration.lineThrough: null,
                            ),
                          ),
                          subtitle: Text(
                            todoData[getIndex].descriptionTask,
                            maxLines: 2, overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              decoration:  todoData[getIndex].isDone ? TextDecoration.lineThrough: null,
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          trailing: Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                  activeColor: Colors.blue.shade800,
                                  shape: const CircleBorder(),
                                  value: todoData[getIndex].isDone,
                                  onChanged: (value)
                                  {
                                    ref.read(serviceProvider)
                                        .updateTask(todoData[getIndex].docID, value);
                                  }
                              )),
                        ),


                        Transform.translate(
                          offset: const Offset(0,-12),
                          child: Column(
                            children: [
                              Divider(
                                color: Colors.grey.shade200,
                                thickness: 1.5,
                              ),


                              Row(
                                children: [
                                  Text(todoData[getIndex].dateTask),
                                  const Gap(12),
                                  Text(todoData[getIndex].timeTask),
                                ],)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        error: (error,stackTrace) =>  Center(child: Text(stackTrace.toString()),),
        loading:()=> const Center(child: CircularProgressIndicator(),)
    );
  }
}
