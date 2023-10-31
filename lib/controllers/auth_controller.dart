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

  Future<void> register() async {

    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.register);
      Map body = {
        'name' : firstName.text.trim(),
        'lastName' : lastName.text.trim(),
        'email' : email.text.trim(),
        'password' : password.text.trim()
      };

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        var token = jsonDecode(response.body)['token'];
        final SharedPreferences? prefs = await _prefs;
        prefs?.setString('token', token);
        firstName.clear();
        lastName.clear();
        email.clear();
        password.clear();
        Get.off(const Placeholder());
      } else {
        throw jsonDecode(response.body)['Messsage'] ?? 'Erro técnico, tente mais tarde';
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          }
      );
    }
  }

  Future<void> login() async {

    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.authenticate);
      Map body = {
        'email' : email.text.trim(),
        'password' : password.text.trim()
      };

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        var token = jsonDecode(response.body)['token'];
        final SharedPreferences prefs = await _prefs;
        prefs.setString('token', token);
        email.clear();
        password.clear();
        Get.off(const Placeholder());
      } else {
        throw jsonDecode(response.body)['Messsage'] ?? 'Erro técnico, tente mais tarde';
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          }
      );
    }
  }

  Future<bool> validateToken(String token) async {
    bool isValid = false;

    try {
      var headers = {'Authorization': 'Bearer $token'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.validate);

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        isValid = jsonDecode(response.body)['isValid'];
      } else {
        throw jsonDecode(response.body)['Messsage'] ?? 'Erro técnico, tente mais tarde';
      }
    } catch (e) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          }
      );
    }
    return isValid;
  }

}