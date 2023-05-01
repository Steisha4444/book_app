import 'package:book_app/services/auth.dart';
import 'package:book_app/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
  }

  // text field state
  String email = '';
  String password = '';
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            // backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              centerTitle: false,
              title: const Text('Sign in to BookTastic'),
              actions: <Widget>[
                ElevatedButton.icon(
                  style: ButtonStyle(
                    // shadowColor: MaterialStateProperty.all(Colors.black),

                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).cardColor.withAlpha(10),
                    ),
                  ),
                  icon: const Icon(Icons.person),
                  label: const Text('Register'),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _loginController,
                      cursorColor: Theme.of(context).secondaryHeaderColor,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).highlightColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                        hoverColor: Theme.of(context).hintColor,
                        labelText: 'login',
                        labelStyle: TextStyle(
                          color: Theme.of(context).splashColor,
                        ),
                      ),
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _passwordController,
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                      cursorColor: Theme.of(context).secondaryHeaderColor,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).highlightColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                        labelText: 'password',
                        labelStyle: TextStyle(
                          color: Theme.of(context).splashColor,
                        ),
                        hintText: 'Enter your password',
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).hintColor,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (val) => val!.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            Theme.of(context).cardColor),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'The login or the password is incorrect';
                            });
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
