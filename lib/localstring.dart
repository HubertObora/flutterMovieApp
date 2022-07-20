// ignore_for_file: file_names

import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          //drawer
          'hello': 'hello world',
          'unlogged': 'Unlogged',
          'login_logout': 'Log in / Register',
          'sign_as': 'Sign as: ',
          'account': 'Account',
          'favorite': 'Favorite',
          'watched': 'Watched',
          'sign_out': 'Sign out',
          'change_language': 'Change Language',
          //account
          'password': 'Password',
          'log_in': 'Log in',
          'register': 'Register',
          'have_account?': 'Do not have an account?',
          'have_account': 'Have an account?',
          'error_while_login': 'Error while trying to login',
          'error_while_register': 'Error while trying to register',
          'account_created': 'Account created!',
          'now_log_in': 'You can log in now',
        },
        'pl_PL': {
          //panel boczny
          'hello': 'witaj świecie',
          'unlogged': 'Niezalogowano',
          'login_logout': 'Zaloguj / Zarejestruj',
          'sign_as': 'Zalogowany jako: ',
          'account': 'Konto',
          'favorite': 'Ulubione',
          'watched': 'Obejrzane',
          'sign_out': 'Wyloguj',
          'change_language': 'Zmień język',
          //konto
          'password': 'Hasło',
          'log_in': 'Zaloguj się',
          'register': 'Zarejestruj się',
          'have_account?': 'Nie masz konta?',
          'have_account': 'Masz już konto?',
          'error_while_login': 'Błąd podczas próby logowania',
          'error_while_register': 'Błąd podczas próby rejestracji',
          'account_created': 'Konto zostało założone!',
          'now_log_in': 'Teraz możesz się zalogować',
        }
      };
}
