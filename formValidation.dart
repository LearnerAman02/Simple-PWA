import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set primary color to pink
      ),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form'),
        backgroundColor: Colors.blue, // Set app bar background color to pink
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.blue[100], // Set text field background color to light pink
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.blue[100], // Set text field background color to light pink
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Password should be at least 6 characters long';
                  } else if (!(value.contains('@') || value.contains('#') || value.contains('&'))) {
                    return 'Password should contain at least one of the following characters: @, #, or &';
                  } else if (!value.contains(new RegExp(r'[A-Za-z]')) || !value.contains(new RegExp(r'[0-9]'))) {
                    return 'Password should be alphanumeric';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Add logic for forget password
                      print('Forget Password clicked');
                    },
                    child: Text(
                      'Forget Password',
                      style: TextStyle(color: Colors.black), // Set text color to pink
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Add logic for sign in
                        print('Sign In clicked');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set button background color to pink
                    ),
                    child: Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
