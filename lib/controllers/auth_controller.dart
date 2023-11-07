import 'dart:convert';
import 'package:condo_app/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> register(BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.register);

    Map body = {
      'firstName' : firstName.text.trim(),
      'lastName' : lastName.text.trim(),
      'email' : email.text.trim(),
      'password' : password.text.trim()
    };

    http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

    if (response.statusCode == 200) {
      var token = jsonDecode(response.body)['token'];
      final SharedPreferences prefs = await _prefs;
      prefs.setString('token', token);
      firstName.clear();
      lastName.clear();
      email.clear();
      password.clear();
      return true;
    } else {
        showErrorDialog(context, jsonDecode(response.body)['errors'].toString());
      return false;
    }
  }

  Future<bool> login(BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.signIn);

    Map body = {
      'email' : email.text.trim(),
      'password' : password.text.trim()
    };

    http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

    if (response.statusCode == 200) {
      var token = jsonDecode(response.body)['token'];
      final SharedPreferences prefs = await _prefs;
      prefs.setString('token', token);
      email.clear();
      password.clear();
      return true;
    } else if (response.statusCode == 403) {
      showErrorDialog(context, "E-Mail ou Password inválidos");
      return false;
    } else {
      showErrorDialog(context, jsonDecode(response.body)['errors'].toString());
      return false;
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}