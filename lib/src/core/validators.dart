import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

mixin Validators {
  final formKey = GlobalKey<FormState>();

  String? validatorUsernameOrEmail(String? value) {
    if (!isLength(value ?? '', 3)) {
      return 'o campo de username ou email deve ter pelo menos 3 dígitos';
    }
    return null;
  }

  String? validatorPassword(String? value) {
    if (!isLength(value ?? '', 6)) {
      return 'a senha deve ter pelo menos 6 dígitos';
    }
    return null;
  }

  String? validatorUsername(String? value) {
    if (!isLength(value ?? '', 3)) {
      return 'o nome de usuário deve ter pelo menos 3 dígitos';
    }
    return null;
  }

  String? validatorEmail(String? value) {
    if (!isEmail(value ?? '')) {
      return 'preencha o campo com um email valido';
    }
    return null;
  }

  String? validatorConfirmPassword(String? value, String password) {
    if (!isLength(value ?? '', 6)) {
      return 'a senha deve ter pelo menos 6 dígitos';
    } else if (value != password) {
      return 'as senhas devem ser iguais';
    }
    return null;
  }
}
