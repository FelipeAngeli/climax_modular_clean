import 'package:flutter/material.dart';

class CustomElevatedButtom extends StatelessWidget {
  final void Function()? onPressed;
  const CustomElevatedButtom({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(
          "Consultar",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xffFE7062),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
