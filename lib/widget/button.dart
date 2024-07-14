import 'package:flutter/material.dart';
import '../FormPage.dart';

enum Sex { Male, Female }

// ignore: must_be_immutable
class RadioButton extends StatelessWidget {
  RadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.values,
    required this.onChanged,
  }) : super(key: key);
  String title;
  Sex value;
  Sex? values;
  Function(Sex?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<Sex>(
        contentPadding: const EdgeInsets.all(0.0),
        value: value,
        groupValue: values,
        dense: true,
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
