import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final controller = TextEditingController();
  final String title;

  TextFieldWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              
            ),
            labelText: title,
          ),
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
