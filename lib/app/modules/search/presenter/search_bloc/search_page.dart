import 'package:climax_modular_clean/app/modules/search/presenter/search_bloc/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'search_page/climate_page.dart';
import 'widget/custom_textfield.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final searchController = ClimateController();

  @override
  Widget build(BuildContext context) {
    String? _searchCity;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Climax'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 100,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/image/fundo.png',
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  _searchCity = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomElevatedButtom(
                onPressed: () async {
                  await Modular.to.pushNamed("/result", arguments: _searchCity);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
