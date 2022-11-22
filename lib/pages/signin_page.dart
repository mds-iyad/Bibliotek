import 'package:bibliotek/pages/register_page.dart';
import 'package:flutter/material.dart';

import '../widgets/HorizontalOrLine.dart';

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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const CircleAvatar(
              radius: 30,
              // ignore: use_full_hex_values_for_flutter_colors
              backgroundColor: Color(0xFFFFBBDEFB),
              child:
                  Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(height: 100, 'assets/images/logo-bleu.png'),
              const Text(
                "Bibliotek",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Column(
                children: const [
                  Text(
                    "Profite d'une ",
                    style: TextStyle(
                        color: Color(0xff1EC2E0),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "meilleure expérience !",
                    style: TextStyle(
                        color: Color(0xff1EC2E0),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          filled: true,
                          // border: InputBorder.none,
                          prefixIcon:
                              Icon(Icons.email, color: Color(0xff1EC2E0)),
                          labelText: 'E-mail',
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
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autofocus: false,
                        obscureText: !_visiblePassword,
                        decoration: InputDecoration(
                            filled: true,
                            // border: InputBorder.none,
                            prefixIcon: const Icon(Icons.lock,
                                color: Color(0xff1EC2E0)),
                            labelText: 'Password',
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
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff1EC2E0),
                            ),
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            child: const Text('Se connecter',
                                style: TextStyle(color: Colors.black87)),
                          ),
                        ),
                      ),
                      Column(children: [
                        const Text("Tu n'as pas de compte ?"),
                        TextButton(
                            onPressed: onPressed,
                            child: const Text(
                              "Inscris-toi maintenant !",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            )),
                      ]),
                      const HorizontalOrLine(height: 10, label: "OU"),
                      const SizedBox(height: 20),
                      Container(
                          height: 50,
                          width: 290,
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Color(0xFF9EC33B),
                            // ),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade300,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              SizedBox(width: 30),
                              Icon(Icons.apple_rounded),
                              SizedBox(width: 20),
                              Center(
                                child: Text(
                                  'Continuer avec Apple',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Container(
                          height: 50,
                          width: 290,
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Color(0xFF9EC33B),
                            // ),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade300,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const SizedBox(width: 30),
                              Image.network(
                                "http://pngimg.com/uploads/google/google_PNG19635.png",
                                height: 30,
                              ),
                              const SizedBox(width: 20),
                              const Center(
                                child: Text(
                                  'Continuer avec Google',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Container(
                          height: 50,
                          width: 290,
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Color(0xFF9EC33B),
                            // ),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade300,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              SizedBox(width: 30),
                              Icon(Icons.supervisor_account),
                              SizedBox(width: 20),
                              Center(
                                child: Text(
                                  "Continuer en tant qu'invité",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
