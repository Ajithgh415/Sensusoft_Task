import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'GetDetailsProvider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ChangeNotifierProvider<GetDetailsProvider>(
        create: (_) => GetDetailsProvider(),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadValues();
  }

  loadValues() {
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final auth = Provider.of<GetDetailsProvider>(context, listen: false);
        auth.loginStatus(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<GetDetailsProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Username',
              icon: Icon(Icons.person),
            ),
            controller: _usernameController,
            onChanged: (value) {
              loginProvider.setUsername(value);
            },
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              icon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(loginProvider.isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  loginProvider.togglePasswordVisibility();
                },
              ),
            ),
            obscureText: !loginProvider.isPasswordVisible,
            controller: _passwordController,
            onChanged: (value) {
              loginProvider.setPassword(value);
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_usernameController.text.isNotEmpty) {
                if (_passwordController.text.isNotEmpty) {
                  if (_usernameController.text.toString() == 'interview' &&
                      _passwordController.text.toString() == 'KHwswLb4ULRq') {
                    loginProvider.login(
                      _usernameController.text,
                      _passwordController.text,
                      context,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Incorrect username or password !")));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Please enter the password")));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("Please enter the username")));
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
