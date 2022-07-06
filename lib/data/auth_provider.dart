import 'dart:convert';

import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier{


  Future<void> signin(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCEFURfvN2crQJvKzn9PvbtX0vc1ZieO-M';
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }
}
