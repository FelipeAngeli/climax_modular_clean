import 'package:climax_modular_clean/app/modules/search/infra/models/result_search_model.dart';

abstract class SearchDataSource {
  Future<ResultSearchModel> getSearch(String searchCity);
}
