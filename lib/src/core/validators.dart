import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

mixin Validators {
  final formKey = GlobalKey<FormState>();

  String? validatorEmail(String? value) {
    if (!isLength(value ?? '', 3)) {
      return 'fill in the field with more than 2 letters';
    }
    return null;
  }

  String? validatorPassword(String? value) {
    if (!isLength(value ?? '', 6)) {
      return 'fill in the field with more than 6 letters';
    }
    return null;
  }
}
