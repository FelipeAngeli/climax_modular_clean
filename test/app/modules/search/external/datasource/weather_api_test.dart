import 'dart:convert';
import 'package:climax_modular_clean/app/modules/search/external/datasource/weather_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../climate_api.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = WeatherApi(dio);
  final _requestOptions = RequestOptions(path: '');

  test('Deve retornar um ResultSearchModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        requestOptions: _requestOptions, data: jsonDecode(climateApi)));
    final future = datasource.getSearch('Tempo');
    expect(future, completes);
  });
}
