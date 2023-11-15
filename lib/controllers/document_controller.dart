import 'dart:convert';
import 'package:condo_app/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DocumentController extends GetxController {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List<Map<String, dynamic>>> getDocuments() async {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.documentEndpoints.documents);

    SharedPreferences prefs = await _prefs;
    String? token = prefs.getString('token');

    http.Response response = await http.get(url, headers: { 'Authorization': 'Bearer $token' });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load documents');
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