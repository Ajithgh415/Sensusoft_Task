// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:sensusofttask/ListPage.dart';
import 'package:sensusofttask/jsonclassed/data.dart';
import 'package:sensusofttask/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetDetailsProvider with ChangeNotifier {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  String _username = '';
  String _password = '';
  bool _isPasswordVisible = false;
  List<Nearby> nearbyList = [];
  List<Popular> popularList = [];
  final String base_url = "http://142.93.106.105/interview/";
  // Pagination variables
  int nearbyPage = 0;
  int popularPage = 0;
  int pageSize = 2;

  String get username => _username;
  String get password => _password;
  bool get isPasswordVisible => _isPasswordVisible;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  loginStatus(context) async {
    final SharedPreferences sp = await _pref;
    String? nearby = sp.getString("nearby");
    String? popular = sp.getString("popular");
    notifyListeners();

    if (popular!.isNotEmpty || nearby!.isNotEmpty) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ListPage()),
          (Route<dynamic> route) => false);
    }
  }

  increaseNearcount() {
    nearbyPage++;
    notifyListeners();
  }

   increasePopularcount() {
    popularPage++;
    notifyListeners();
  }


  loadlistvalues() async {
    final SharedPreferences sp = await _pref;
    String? nearby = sp.getString("nearby");
    String? popular = sp.getString("popular");
    notifyListeners();
    if (popular != null) {
      // print(popular.toString());
      List<dynamic> jsonList = jsonDecode(popular);
      List<Popular> myList =
          jsonList.map((json) => Popular.fromJson(json)).toList();
      popularList.addAll(myList);
      print(popularList.length);
      notifyListeners();
    }
    if (nearby != null) {
      // print(nearby.toString());
      List<dynamic> jsonList = jsonDecode(nearby);
      List<Nearby> myList =
          jsonList.map((json) => Nearby.fromJson(json)).toList();
      nearbyList.addAll(myList);
      print(nearbyList.length);
      notifyListeners();
    }
  }

  // Pagination functions
 List<Nearby>? getNearbyPage() {
    int start = nearbyPage * pageSize;
    print(nearbyList.length);
    int end = (start + pageSize) > nearbyList.length
        ? nearbyList.length
        : (start + pageSize);
   return nearbyList.sublist(0, end);
   
  }

 List<Popular>? getPopularPage() {
    int start = popularPage * pageSize;
    print(popularList.length);
    int end = (start + pageSize) > popularList.length
        ? popularList.length
        : (start + pageSize);
    if (popularList.isEmpty) {
      return popularList.sublist(0, popularList.length);
    }
    print(popularList.length);
    return popularList.sublist(0, end);
    
  }

  void login(String username, String password, BuildContext context) {
    getData(username, password, context);
    notifyListeners();
  }

  getData(String username, String password, BuildContext context) async {
    String url = base_url;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    print(username + password);
    notifyListeners();

    try {
      var future = http.get(
        Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth},
      );
      var response = await future;
      print(response.body.toString());
      notifyListeners();
      if (response.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 1)).then((value) async {
          ResponseData rs = ResponseData();
          rs = responseDataFromJson(response.body);
          //  Navigator.pop(context);
          if (rs.data!.nearby!.isNotEmpty && rs.data!.popular!.isNotEmpty) {
            String nearbyJson = jsonEncode(rs.data!.nearby);
            String popularjson = jsonEncode(rs.data!.popular);
            print("pop$popularjson");
            final sp = await SharedPreferences.getInstance();
            await sp.setString("nearby", nearbyJson);
            await sp.setString("popular", popularjson);
            notifyListeners();
            navigationpage(context);
          }
        });
      }
    } catch (e) {
      return null;
    }
  }

  navigationpage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ListPage()),
        (Route<dynamic> route) => false);
  }
}
