import 'package:climax_modular_clean/app/modules/search/domain/entities/result_search.dart';
import 'package:climax_modular_clean/app/modules/search/domain/erros/failure_search.dart';
import 'package:climax_modular_clean/app/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, ResultSearch>> call(String searchCity);
}

class SearchBtTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchBtTextImpl(this.repository);
  @override
  Future<Either<FailureSearch, ResultSearch>> call(String searchCity) async {
    if (searchCity == '') {
      return Left(InvalidTextError());
    }
    return repository.search(searchCity);
  }
}
