import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user.provider.dart';
import '../utils/utils.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {

    var usr = context.watch<User>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: getColor(),
        child: FutureBuilder(
          future: usr.user,
          builder: (context, snapshot) {
            print(snapshot.data);
            if(snapshot.hasData){
              return Container(
                child: Column(
                  children: [
                    Text(snapshot.data!.username),
                  ],
                ),
              );
            }else{
              //Navigator.pushNamed(context, '/dashboard');
              return const Text('No data');
            }
          },
        ),
      ),
    );
  }
}





