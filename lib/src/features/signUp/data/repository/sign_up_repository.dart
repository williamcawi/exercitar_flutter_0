import 'package:exercitar_0/src/features/signUp/data/service/sign_up_service.dart';
import 'package:fpdart/fpdart.dart';

class SignUpRepository {
  final SignUpService _service;

  SignUpRepository({required SignUpService service}) : _service = service;

  Future<Either<String, String>> signUp(
      {required String username,
      required String email,
      required String password}) async {
    try {
      return Right((await _service.signUp(
          username: username, email: email, password: password))['message']);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
