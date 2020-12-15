import 'dart:convert';

import 'package:conduit/models/loggedin_user.dart';
import 'package:conduit/utils/global_data.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  static void getCurrentUser() async {
    var url = 'https://conduit.productionready.io/api/user';
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Token ${preferences.getString('userToken')}"
    });
    var jsonRes = jsonDecode(response.body);
    // print(jsonRes);
    GlobalData.loggedinUser = LoggedinUser.fromJson(jsonRes);
    print("TOKEN :" + GlobalData.loggedinUser.user.token);
  }
}
