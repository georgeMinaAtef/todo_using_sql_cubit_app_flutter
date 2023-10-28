
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/radio_provider.dart';

class RadioWidget extends ConsumerWidget{
  const RadioWidget( {super.key, required this.radioTitle, required this.category, required this.valueInput, required this.onChangedCall,});

  final String radioTitle;
  final Color category;
  final int valueInput;
  final VoidCallback onChangedCall;

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    final radioCategory = ref.watch(radioProvider);

    return  Material(
      child: Theme(
        data: ThemeData(
            unselectedWidgetColor: category
        ),
        child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: category,

            title: Transform.translate(
              offset: const Offset(-22,0),
              child:  Text(
                radioTitle,
                style: TextStyle(
                  color: category,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            value: valueInput,
            groupValue: radioCategory,
            onChanged: (value) => onChangedCall
        ),
      ),
    );
  }
}