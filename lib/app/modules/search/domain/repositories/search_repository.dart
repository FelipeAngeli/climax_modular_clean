import 'package:climax_modular_clean/app/modules/search/domain/entities/result_search.dart';
import 'package:climax_modular_clean/app/modules/search/domain/erros/failure_search.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, ResultSearch>> search(String searchCity);
}
