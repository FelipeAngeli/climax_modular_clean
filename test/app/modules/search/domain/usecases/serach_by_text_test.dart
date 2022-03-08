import 'package:climax_modular_clean/app/modules/search/domain/entities/result_search.dart';
import 'package:climax_modular_clean/app/modules/search/domain/repositories/search_repository.dart';
import 'package:climax_modular_clean/app/modules/search/domain/usecases/serach_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchBtTextImpl(repository);

  var resultSearch = ResultSearch(
    day: 'Dia',
    description: 'Descrição',
    forecast: [],
    temperature: 'Temperatura',
    wind: 'vento',
  );
  test('Deve retornar uma lista', () async {
    when(() => repository.search(any()))
        .thenAnswer((_) async => Right(resultSearch));
    final result = await usecase.call("Porto Alegre");
    expect(result.fold(id, id), isA<ResultSearch>());
  });

  test('Deve retornar um erro', () async {
    when(() => repository.search(''))
        .thenAnswer((_) async => Right(resultSearch));
    final result = await usecase.call('');
    expect(result.isLeft(), true);
  });
}
