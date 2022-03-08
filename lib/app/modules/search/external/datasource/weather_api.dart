import 'package:climax_modular_clean/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:climax_modular_clean/app/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

class WeatherApi implements SearchDataSource {
  final Dio dio;
  WeatherApi(this.dio);
  @override
  Future<ResultSearchModel> getSearch(String searchCity) async {
    final response =
        await dio.get('https://goweather.herokuapp.com/weather/$searchCity');

    ResultSearchModel resultSearchModel =
        ResultSearchModel.fromJson(response.data);
    return resultSearchModel;
  }
}
