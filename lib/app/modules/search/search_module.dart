import 'package:climax_modular_clean/app/modules/search/presenter/search_bloc/search_page/bloc/search_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/search_bloc/result_page.dart';
import 'presenter/search_bloc/search_page.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SearchBloc(i())),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => SearchPage()),
    ChildRoute("/result", child: (_, args) => ResultPage(result: args.data)),
  ];
}
