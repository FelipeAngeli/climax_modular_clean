import 'package:climax_modular_clean/app/modules/search/domain/entities/result_search.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final ResultSearch? resultSearch;
  const CustomCard({
    Key? key,
    this.resultSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFFFFFFF).withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Dia " + resultSearch!.day,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              resultSearch!.temperature,
              style: const TextStyle(fontSize: 32),
            ),
            Text(
              "Vento " + resultSearch!.wind,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
