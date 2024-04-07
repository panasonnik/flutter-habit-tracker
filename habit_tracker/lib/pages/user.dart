import 'package:flutter/material.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:provider/provider.dart';
import 'package:habit_tracker/models/auth.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String login = '';
  String password = '';
  final Authenticator _auth = Authenticator();

  String loginStatus = ''; // Variable to hold login status

  Future<void> _authenticate(BuildContext context) async {
    _auth.authenticate(login, password).then((result) {
      setState(() {
        // Update login status based on authentication result
        if (result == AuthenticationResult.success) {
          loginStatus = 'Successful';
        } else {
          loginStatus = 'Failed';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'User Page',
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter login...',
            ),
            onChanged: (input) {
              setState(() {
                login = input;
              });
            },
          ),
          const SizedBox(height: 20.0),
          TextField(
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter password...',
            ),
            onChanged: (input) {
              setState(() {
                password = input;
              });
            },
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              _authenticate(context);
            },
            child: const Text('Login'),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            loginStatus, // Display login status
            style: TextStyle(
              color: loginStatus == 'Successful' ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const Expanded(child: SizedBox()),
          ElevatedButton(
              onPressed:
                  Provider.of<AppModel>(context, listen: false).deleteHabits,
              child: const Text("Delete all data"))
        ],
      ),
    );
  }
}
