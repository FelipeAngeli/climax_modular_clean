import 'package:bloc_test/bloc_test.dart';
import 'package:climax_modular_clean/app/modules/search/domain/entities/result_search.dart';
import 'package:climax_modular_clean/app/modules/search/domain/usecases/serach_by_text.dart';
import 'package:climax_modular_clean/app/modules/search/presenter/search_bloc/search_page/bloc/search_bloc.dart';
import 'package:climax_modular_clean/app/modules/search/presenter/search_bloc/search_page/bloc/search_bloc_event.dart';
import 'package:climax_modular_clean/app/modules/search/presenter/search_bloc/search_page/bloc/search_bloc_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  final usecase = SearchByTextMock();

  var resultSearch = ResultSearch(
    description: 'Descrição',
    temperature: 'Temperatura',
    wind: 'Vento',
    day: 'Dia',
    forecast: [],
  );

  blocTest<SearchBloc, SearchState>(
    'Deve retornar os estados na ordem correta',
    build: () {
      when(() => usecase.call(any()))
          .thenAnswer((_) async => Right(resultSearch));
      return SearchBloc(usecase);
    },
    act: (bloc) => bloc.add(SearchTextEvent("Tempo")),
    expect: () => [
      isA<SearchLoading>(),
      isA<SearchSuccess>(),
    ],
  );
}
