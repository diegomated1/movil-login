import 'package:flutter/cupertino.dart';

import '../api/user.api.dart';
import '../model/user.model.dart';

class User extends ChangeNotifier {

  late Future<UserInfo> user;

  get()async{
    user = UserApi().auth();
    notifyListeners();
  }

  User(){
    get();
  }
}





