import 'package:condo_app/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenUtils {
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token ?? '';
  }

  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('token');
  }

  static Future<bool> isAuthenticated() async {
    String token = await getToken();

    if (token.isEmpty) {
      return false;
    }

    final response = await http.get(
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.validate),
      headers: { 'Authorization': 'Bearer $token' }
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['valid'];
    } else {
      await removeToken();
      return false;
    }

  }

}