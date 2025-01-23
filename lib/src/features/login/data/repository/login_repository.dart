import 'package:exercitar_0/src/features/login/data/service/login_service.dart';
import 'package:fpdart/fpdart.dart';

class LoginRepository {
  final LoginService _service;
  LoginRepository({required LoginService service}) : _service = service;

  Future<Either<String, String>> login(
      {required String usernameOrEmail, required String password}) async {
    try {
      return Right((await _service.login(
          usernameOrEmail: usernameOrEmail, password: password))['message']);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
