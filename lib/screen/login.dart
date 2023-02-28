import 'package:flutter/material.dart';
import '../api/user.api.dart';
import '../widgets/button.dart';
import '../widgets/input.dart';

class Login extends StatefulWidget {
  const Login({ super.key });

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late Map<String, String> userInfo = {
    "email": '',
    "password": '',
  };

  change(String label, String newValue){
    userInfo[label.split(' ').join('_').toLowerCase()] = newValue;
  }

  var loginForm = GlobalKey<FormState>();

  go(){
    Navigator.pushNamed(context, '/dashboard');
  }

  submit()async{
    if(loginForm.currentState!.validate()){
      loginForm.currentState!.save();
      //print(userInfo.toString());
      var result = await UserApi().login(userInfo: userInfo);
      if(result==true){
        go();
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: Form(
            key: loginForm,
            child: Column(
              children: [
                Input(labelText: 'Email', handler: change),
                Input(labelText: 'Password', handler: change),
                Button(labelText: 'Login', handler: submit,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}