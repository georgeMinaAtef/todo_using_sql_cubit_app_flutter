

import 'package:firebase_and_flutter_app/app/const.dart';
import 'package:firebase_and_flutter_app/data/common/widget/date_time_widget.dart';
import 'package:firebase_and_flutter_app/data/common/widget/field_widget.dart';
import 'package:firebase_and_flutter_app/data/common/widget/radio_wiget.dart';
import 'package:firebase_and_flutter_app/data/provider/date_time_provider.dart';
import 'package:firebase_and_flutter_app/data/provider/radio_provider.dart';
import 'package:firebase_and_flutter_app/data/provider/serivce_provider.dart';
import 'package:firebase_and_flutter_app/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class AddNewTaskModel extends ConsumerWidget {
   AddNewTaskModel({super.key});


  var titleController = TextEditingController();
  var descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datePro = ref.watch(dateProvider);
    final timePro = ref.watch(timeProvider);
    final servicePro = ref.watch(serviceProvider);

    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height*0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
              child: Text(
                'New task todo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              )
          ),


           Divider(thickness: 1.2,color: Colors.grey.shade200,),

           const Gap(12),

           const Text(
            'Title task ',
            style:AppConst.headingOne,
          ),

          const Gap(6),

          ConstFieldWidget(hintText: 'Add Name', maxLine: 1, textController: titleController),

          const Gap(12),

           const Text(
            'Description task ',
            style:AppConst.headingOne,
          ),

          const Gap(6),

          ConstFieldWidget(hintText: 'Add Description', maxLine: 5, textController: descriptionController),

          const Gap(12),

          const Text(
            'Category',
            style:AppConst.headingOne,
          ),

           Row(
            children: [
              Expanded(
                child: RadioWidget(
                  radioTitle:'LAN' ,
                  category: Colors.green,
                  valueInput: 1,
                  onChangedCall: () => ref.read(radioProvider.notifier).update((state) => 1),
              )
              ),
              Expanded(
                child: RadioWidget(
                  radioTitle:'WRK' ,
                  category: Colors.blue.shade700,
                  valueInput: 2,
                  onChangedCall: () => ref.read(radioProvider.notifier).update((state) => 2),
                )
              ),
              Expanded(
                child: RadioWidget(
                  radioTitle:'GEN' ,
                  category: Colors.amberAccent.shade700,
                  valueInput: 3,
                  onChangedCall: () => ref.read(radioProvider.notifier).update((state) => 3),
                )
              ),

            ],
          ),


           // date Time Section
            Row(
            children: [
              DateTimeWidget(
                  titleText: 'date',
                  valueText: datePro,
                  iconSection: CupertinoIcons.calendar,
                   onTap: () async
                  {
                    final getValue =  await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021) ,
                      lastDate: DateTime(2030),
                    ) ;
                    if(getValue != null)
                    {
                      final format = DateFormat.yMd();
                      ref.read(dateProvider.notifier).update((state) => format.format(getValue));
                    }

                  }
              ),
              const Gap(22),
              DateTimeWidget(
                  titleText: 'date',
                  valueText: ref.watch(timeProvider),
                  iconSection: CupertinoIcons.clock,
                onTap: () async{
                  final getTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if(getTime != null)
                  {
                    final format = DateFormat.yMd();
                    ref.read(timeProvider.notifier).update((state) => getTime.format(context));
                  }

                  }
              ),
            ],
          ),


          const Gap(12),


          // button Section
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.of(context).pop();
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.grey.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.blue.shade800),
                    ),
                    padding:const EdgeInsets.all(14),

                  ),
                    child: const Text('Cancel'),
                ),
              ),

              const Gap(20),

              Expanded(
                child: ElevatedButton(
                    onPressed: ()
                    {

                      final getRadioValue = ref.read(radioProvider);
                      String category = '';
                      switch(getRadioValue)
                      {
                        case 1 : category = 'Learning' ; break;
                        case 2 : category = 'Working' ; break;
                        case 3 : category = 'General' ; break;
                      }

                      ref.read(serviceProvider).addNewTask(
                        ToDoModel(
                            isDone: false,
                            titleTask: titleController.text,
                            descriptionTask: descriptionController.text,
                            dateTask: ref.read(dateProvider),
                            timeTask: ref.read(timeProvider),
                            categoryTask: category
                      ));
                      // titleController.clear();
                      // descriptionController.clear();
                      // ref.read(radioProvider.notifier).update((state) => 0);
                      // ref.read(dateProvider.notifier).update((state) => 'dd/mm/yy');
                      // ref.read(timeProvider.notifier).update((state) => 'hh:mm');
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.blue.shade800),
                      ),
                      padding:const EdgeInsets.all(14),

                    ),
                    child: const Text('Create')
                ),
              ),
            ],
          ),





        ],
      ),
    );
  }
}
