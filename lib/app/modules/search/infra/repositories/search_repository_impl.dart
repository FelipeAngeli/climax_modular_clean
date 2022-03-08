import 'package:climax_modular_clean/app/modules/search/domain/entities/result_search.dart';
import 'package:climax_modular_clean/app/modules/search/domain/erros/failure_search.dart';
import 'package:climax_modular_clean/app/modules/search/domain/repositories/search_repository.dart';
import 'package:climax_modular_clean/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  //intanciei o contrato e estou passando ele via construtor (injeção de dependencia)
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  //chama o metodo do nosso contrato, que foi criado no domain
  Future<Either<FailureSearch, ResultSearch>> search(String searchCity) async {
    try {
      final result = await dataSource.getSearch(searchCity);
      //verficação do datasource
      if (result.temperature.isEmpty) {
        return Left(InvalidTextError());
      }
      return Right(result);
      // em baixo - não vai ser um tratamento de erro generico
    } on DataSourceError catch (e) {
      return Left(e);
    }
  }
}
