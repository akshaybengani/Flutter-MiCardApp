import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_card_flutter/calls_and_messenging_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

    final String number = "7737929302";
    final String email = "akshaybengani@gmail.com";

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/akshaybengani.jpg'),
                ),
                Text(
                  'Akshay Bengani',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal[100],
                    fontSize: 20,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 250,
                  child: Divider(
                    color: Colors.teal[900],
                  ),
                ),
                GestureDetector(
                  onTap: () => _service.call(number),
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal[900],
                      ),
                      title: Text(
                        '+91-7737929302',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 16,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => _service.sendEmail(email),
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal[900],
                      ),
                      title: Text(
                        'akshaybengani@gmail.com',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 16,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
