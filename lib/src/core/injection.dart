import 'package:exercitar_0/src/features/login/data/repository/login_repository.dart';
import 'package:exercitar_0/src/features/login/data/service/login_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final GetIt getIt = GetIt.I;

void initDependencies() {
  getIt.registerFactory<Client>(() => Client());

  getIt.registerFactory<LoginService>(
      () => LoginService(client: getIt<Client>()));
  getIt.registerFactory<LoginRepository>(
      () => LoginRepository(service: getIt<LoginService>()));
}
