import 'package:flutter/material.dart';

import '../api/user.api.dart';
import '../widgets/button.dart';
import '../widgets/input.dart';


class Register extends StatefulWidget {
  const Register({ super.key });

  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  late String numberPhone;
  late String cc;
  late String firstName;
  late String secondName;
  late String password;

  late Map<String, String> userInfo = {
    "username": '',
    "custom_username": '',
    "email": '',
    "password": '',
  };

  change(String label, String newValue){
    userInfo[label.split(' ').join('_').toLowerCase()] = newValue;
  }
  
  var registerForm = GlobalKey<FormState>();

  go(){
    Navigator.pushNamed(context, '/dashboard');
  }

  submit()async{
    if(registerForm.currentState!.validate()){
      registerForm.currentState!.save();
      //print(userInfo.toString());
      var result = await UserApi().register(userInfo: userInfo);
      if(result==true){
        go();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 450,
          child: Form(
            key: registerForm,
            child: Column(
              children: [
                Input(labelText: 'Username', handler: change),
                Input(labelText: 'Custom Username', handler: change),
                Input(labelText: 'Email', handler: change),
                Input(labelText: 'Password', handler: change),
                Button(labelText: 'Register', handler: submit,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


