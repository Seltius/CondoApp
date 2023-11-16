import 'dart:convert';
import 'package:condo_app/models/document.dart';
import 'package:condo_app/utils/api_endpoints.dart';
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

  Future<Document> getDocument(int documentId) async {
    var url = Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.documentEndpoints.documents}/$documentId");

    SharedPreferences prefs = await _prefs;
    String? token = prefs.getString('token');

    http.Response response = await http.get(url, headers: { 'Authorization': 'Bearer $token' });

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return Document(
          id: body['id'],
          name: body['name'],
          fileData: body['fileData']);
    } else {
      throw Exception('Failed to load specific document');
    }
  }

}