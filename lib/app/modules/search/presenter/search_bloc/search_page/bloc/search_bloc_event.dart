// part of 'searchbloc_bloc.dart';

import 'package:flutter/material.dart';

@immutable
abstract class SearchEvent {}

class SearchTextEvent implements SearchEvent {
  final String? searchCity;
  SearchTextEvent(this.searchCity);
}
