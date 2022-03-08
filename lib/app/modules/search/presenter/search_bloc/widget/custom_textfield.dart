import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
            labelText: "Digite sua cidade",
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            alignLabelWithHint: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Color(0xff595FFB)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Color(0xff595FFB)),
              borderRadius: BorderRadius.circular(15),
            )));
  }
}
