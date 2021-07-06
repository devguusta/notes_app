import 'package:email_validator/email_validator.dart';

class Validators {
  String? validateName(String value) {
    return value.isEmpty ? "Campo obrigátorio" : null;
  }

  String? validateEmail(String value) {
    final bool isValid = EmailValidator.validate(value);
    return isValid ? null : 'E-mail inválido';
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Campo inválido";
    }
   
    if (password.length >= 8) {
      return null;
    } else {
      var myRichRunesMessage = new Runes(
        ' \u{1F512} Escolha uma senha mais forte',
      );

      return new String.fromCharCodes(myRichRunesMessage);
    }
  }
   String? validatePasswordConfirmation(
      String password, String confirmPassword) {
    if (confirmPassword == password) {
      return null;
    } else {
      return "As senhas não conferem";
    }
  }



}