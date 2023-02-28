import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_users/model/user.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  String url = 'http://10.153.50.50:3000/api/user';

  Future<bool> login({required Map<String, String> userInfo,}) async {
    try{
      var headers = {"Content-type": "application/json"};
      var body = json.encode(userInfo); 
      var response = await http.post(Uri.parse('$url/auth/login'), headers: headers, body: body);
      if(response.statusCode == 200){
        var token = json.decode(response.body)['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userToken', token);
        return true;
      } else {
        print(response.body.toString());
        return false;
      }
    }catch(e){
      return false;
    }
  }

  Future<bool> register({required Map<String, String> userInfo,}) async {
    try{
      var headers = {"Content-type": "application/json"};
      var body = json.encode(userInfo); 
      var response = await http.post(Uri.parse('$url/auth/register'), headers: headers, body: body);
      if(response.statusCode == 200){
        var token = json.decode(response.body)['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userToken', token);
        return true;
      } else {
        print(response.body.toString());
        return false;
      }
    }catch(e){
      return false;
    }
  }

  Future<UserInfo> auth() async {
    try{
      var prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');
      if(userToken==null){
        throw 'no';
      }
      var headers = {"Content-type": "application/json", "Authorization": 'Bearer $userToken'};
      var response = await http.post(Uri.parse('$url/auth'), headers: headers);
      if(response.statusCode == 200){
        var user = json.decode(response.body)['user'];
        return UserInfo.fromJson(user);
      } else {
        print(response.body.toString());
        throw 'no';
      }
    }catch(e){
      throw 'no';
    }
  }

}