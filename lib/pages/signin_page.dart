import 'package:bibliotek/pages/register_page.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  bool _visiblePassword = false;

  void onPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: const Text("Sign in"),
          backgroundColor: const Color(0xff53EBC4),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:
                          Icon(Icons.alternate_email, color: Color(0xff53EBC4)),
                      labelText: 'Enter your E-mail',
                      labelStyle: TextStyle(color: Colors.black87),
                    ),
                    textCapitalization: TextCapitalization.words,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: !_visiblePassword,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.password_outlined,
                            color: Color(0xff53EBC4)),
                        labelText: 'Enter your password',
                        labelStyle: const TextStyle(color: Colors.black87),
                        suffixIcon: InkWell(
                          child: Icon(
                            _visiblePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black87,
                          ),
                          onTap: () {
                            setState(() {
                              _visiblePassword = !_visiblePassword;
                            });
                          },
                        )),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff53EBC4),
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Sign in',
                          style: TextStyle(color: Colors.black87)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          TextButton(
                              onPressed: onPressed,
                              child: const Text(
                                "Register",
                                style: TextStyle(color: Colors.blue),
                              )),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
