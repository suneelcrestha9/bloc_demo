import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:demo/data/model/dress_model.dart';
import 'package:http/http.dart' as http;

class DressApiServices {
  final url = "https://fashion-fusion-suneel.vercel.app/api/dress";

  // method to fetch the dress
  Future<List<DressModel>> fetchDress() async {
    try {
      final res = await http.get(Uri.parse(url));
      final data = jsonDecode(res.body);
      final List finalData = data["dress"];
      return finalData.map((json) => DressModel.fromJson(json)).toList();
    } on SocketException {
      throw Exception("Socket exception occored");
    } on TimeoutException {
      throw Exception("Time out error");
    } catch (e) {
      throw Exception("Internal server error $e");
    }
  }

  // method to post the new dress
  Future<List> postDress(DressModel data) async {
    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      final responsedata = jsonDecode(res.body);
      final List finaldata = responsedata["dress"];
      return finaldata.map((json) => DressModel.fromJson(json)).toList();
    } on SocketException {
      throw Exception("Socket exception occored");
    } on TimeoutException {
      throw Exception("Time out error");
    } catch (e) {
      throw Exception("Internal server error $e");
    }
  }

  // method to delete the dress
  Future<String> deleteDress(String id) async {
    try {
      final res = await http.delete(Uri.parse("$url/$id"));
      return "Successfully delete the dress ${res.statusCode}";
    } on SocketException {
      throw Exception("Socket exception occored");
    } on TimeoutException {
      throw Exception("Time out error");
    } catch (e) {
      throw Exception("Internal server error $e");
    }
  }
}
