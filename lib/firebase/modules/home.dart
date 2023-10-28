
import 'package:firebase_and_flutter_app/data/provider/serivce_provider.dart';
import 'package:firebase_and_flutter_app/data/common/show_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../data/common/widget/card_todo_widget.dart';

class HomeData extends ConsumerWidget {
   const HomeData({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final todoData = ref.watch(fetchStreamProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber.shade200,
            radius: 25,
            child: Image.network('https://i.ibb.co/fC98MWS/profile.png'),),
          title:  Text(
              'Hello I\'m ',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
          subtitle:  const Text(
              'George Mina ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(onPressed: ()
                {

                },
                icon: const Icon(CupertinoIcons.calendar)),

                IconButton(onPressed: ()
                {

                },
                icon: const Icon(CupertinoIcons.bell)),
              ],
            ),
          )
        ],
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [

              const Gap(20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                         'To Day\'s Task',
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold
                       ),
                     ),
                     Text(
                         'Wednesday, 11 May',
                       style: TextStyle(
                           color: Colors.grey
                       ),
                     ),
                   ],
                 ),


                  ElevatedButton(
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          builder: (context) =>  AddNewTaskModel(),
                      ),
                     style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD5E8FA),
                      foregroundColor: Colors.blue.shade800,
                       elevation: 0,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(8),
                       ),
                    ),
                      child: const Text(
                          '+ New Task',
                      ),
                  )
                ],
              ),

              const Gap(20),


              // cart List Task
              ListView.builder(
                  itemCount: todoData.value!.length ?? 0 ,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>  CartToDoWidget(getIndex: index,)
              )
            ],
          ),
        ),
      ),
    );
  }
}

