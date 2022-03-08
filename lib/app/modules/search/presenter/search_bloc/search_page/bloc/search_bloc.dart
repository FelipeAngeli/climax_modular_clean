import 'package:bloc/bloc.dart';
import 'package:climax_modular_clean/app/modules/search/domain/usecases/serach_by_text.dart';

import 'search_bloc_event.dart';
import 'search_bloc_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchByText usecase;

  SearchBloc(this.usecase) : super(SearchInitial()) {
    on<SearchTextEvent>(getText);
  }

  getText(SearchTextEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await usecase.call(event.searchCity!);
    emit(result.fold((l) => SearchError(), (r) => SearchSuccess(r)));
  }
}
