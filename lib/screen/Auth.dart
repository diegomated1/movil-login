import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';
import '../widgets/button.dart';

class Auth extends StatefulWidget {
  const Auth({ super.key });

  @override
  State<StatefulWidget> createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  go(){
    Navigator.pushNamed(context, '/dashboard');
  }

  handleAuth() async {
    var prefs = await SharedPreferences.getInstance();
    var userToken = prefs.getString('userToken');
    if(userToken!=null){
      bool expired = JwtDecoder.isExpired(userToken);
      if(expired==false){
        go();
      }
    }
  }

  @override
  void initState()  {
    super.initState();
    handleAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 250,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Button(
                    labelText: 'Login',
                    handler: () {
                      Navigator.pushNamed(context, '/login');
                    }
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Button(
                    labelText: 'Register',
                    handler: () {
                      Navigator.pushNamed(context, '/register');
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
