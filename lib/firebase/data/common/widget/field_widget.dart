
import 'package:flutter/material.dart';


class ConstFieldWidget extends StatelessWidget {
   ConstFieldWidget({super.key, required this.hintText, required this.maxLine, required this.textController});

  final String hintText;
  final int maxLine;
  TextEditingController textController ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),

      ),
      child: TextFormField(
        maxLines: maxLine,
        controller: textController,
        decoration:  InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,

        ),
      ),
    );
  }
}


