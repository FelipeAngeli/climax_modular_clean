import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'search/domain/usecases/serach_by_text.dart';
import 'search/external/datasource/weather_api.dart';
import 'search/infra/repositories/search_repository_impl.dart';
import 'search/presenter/search_bloc/search_page/bloc/search_bloc.dart';
import 'search/search_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(((i) => Dio())),
        Bind(((i) => WeatherApi(i()))),
        Bind(((i) => SearchRepositoryImpl(i()))),
        Bind(((i) => SearchBtTextImpl(i()))),
        Bind(((i) => SearchBloc(i()))),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SearchModule()),
      ];
}
