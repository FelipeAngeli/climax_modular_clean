import 'package:climax_modular_clean/app/modules/search/presenter/search_bloc/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'search_page/bloc/search_bloc.dart';
import 'search_page/bloc/search_bloc_event.dart';
import 'search_page/bloc/search_bloc_state.dart';
import 'search_page/climate_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);
  final String result;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final bloc = Modular.get<SearchBloc>();

  final searchController = ClimateController();

  @override
  void initState() {
    bloc.add(SearchTextEvent(widget.result));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<SearchBloc, SearchState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const Center();
                }

                if (state is SearchLoading) {
                  return const Center(
                    heightFactor: 15,
                    child: SizedBox(
                      width: 54,
                      height: 54,
                      child: CircularProgressIndicator(
                        backgroundColor: Color(0xffFE7062),
                        color: Color(0xff595FFB),
                        strokeWidth: 6,
                      ),
                    ),
                  );
                }

                if (state is SearchError) {
                  return Container(
                    child: Image.asset("assets/image/erro.png"),
                    alignment: Alignment.center,
                  );
                }

                final result = (state as SearchSuccess).resultSearch;
                return Container(
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        searchController.getImage(result.description),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(100.0),
                        child: Column(
                          children: [
                            Text(
                              "Céu " + result.description,
                              style: const TextStyle(fontSize: 32),
                            ),
                            Text(
                              result.temperature,
                              style: const TextStyle(
                                fontSize: 54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Vento " + result.wind,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomCard(resultSearch: result.forecast[0]),
                          CustomCard(resultSearch: result.forecast[1]),
                          CustomCard(resultSearch: result.forecast[2]),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}





// children: [
//                         SizedBox(
//                           child: Image.asset(
//                             searchController.getImage(result.description),
//                             height: 80,
//                             width: 80,
//                           ),
//                         ),
//                         Expanded(
//                           child: Align(
//                             alignment: Alignment.bottomRight,
//                             child: Text(result.description),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Text(result.wind),
//                         ),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Text(
//                             result.temperature,
//                             style: const TextStyle(
//                               fontSize: 54,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomForecastCard(
//                                 resultSearch: result.forecast[0]),
//                             CustomForecastCard(
//                                 resultSearch: result.forecast[1]),
//                             CustomForecastCard(
//                                 resultSearch: result.forecast[2]),
//                           ],
//                         ),
//                       ],
