import 'package:climax_modular_clean/app/modules/search/domain/entities/result_search.dart';
import 'package:climax_modular_clean/app/modules/search/domain/erros/failure_search.dart';
import 'package:climax_modular_clean/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:climax_modular_clean/app/modules/search/infra/models/result_search_model.dart';
import 'package:climax_modular_clean/app/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class SearchDatasourceMock extends Mock implements SearchDataSource {}

class ResultSearchMapperMock extends Mock implements ResultSearch {}

void main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);
  final resultSearch = ResultSearchModel(
    day: '123',
    description: '123',
    forecast: [],
    temperature: '123',
    wind: '123',
  );

  test('Deve retornar uma lista de ResultSearch', () async {
    when(() => datasource.getSearch(any()))
        .thenAnswer((_) async => resultSearch);
    final result = await repository.search('Curitiba');
    expect(result.fold(id, id), isA<ResultSearch>());
  });

  test('Deve retornar um DatasourceError se o datasource falhar', () async {
    when(() => datasource.getSearch(any())).thenThrow(DataSourceError());
    final result = await repository.search('Curitiba');
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
