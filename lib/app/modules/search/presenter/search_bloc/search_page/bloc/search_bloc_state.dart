//part of 'searchbloc_bloc.dart';

import 'package:climax_modular_clean/app/modules/search/domain/entities/result_search.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final ResultSearch resultSearch;
  SearchSuccess(this.resultSearch);
}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {}
