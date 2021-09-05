import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttershop/const/globalmethod.dart';
import 'package:google_fonts/google_fonts.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  _signupScreenState createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final _formkey = GlobalKey<FormState>();
  bool _obsecuretext = true;
  String _emailAddress = '';
  String _firstname = '';
  String _lastname = '';
  String _password = '';
  String _msg = '';
  bool _isloading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalMethods _message = GlobalMethods();
  void _Submitform() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      _formkey.currentState!.save();

      try {
        await _auth.createUserWithEmailAndPassword(
            email: _emailAddress.toLowerCase().trim(), password: _password);
      } catch (error) {
        _message.authErrorHandle(error.toString(), context);
        // print('Error ' + error.toString());
      }
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Container(
                color: Colors.orange.withOpacity(0.3),
                child: Center(
                    child: Text(
                  'signup',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    color: Colors.orange.withOpacity(0.3),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(70)),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2.0,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                hintText: 'Enter First Name',
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(
                                  Icons.account_box,
                                  color: Colors.black,
                                ),
                                // suffixIcon: Icon(Icons.lock),
                              ),
                              onSaved: (value) {
                                _firstname = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Enter Name';
                                else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2.0,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                hintText: 'Enter Last Name',
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(
                                  Icons.account_box,
                                  color: Colors.black,
                                ),
                                // suffixIcon: Icon(Icons.lock),
                              ),
                              onSaved: (value) {
                                _lastname = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Enter Name';
                                else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2.0,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                hintText: 'Enter Email',
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                // suffixIcon: Icon(Icons.lock),
                              ),
                              onSaved: (value) {
                                _emailAddress = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@'))
                                  return 'Enter Valid Email address';
                                else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2.0,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                hintText: 'Enter Paswword',
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obsecuretext = !_obsecuretext;
                                      });
                                    },
                                    child: _obsecuretext
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: Colors.black,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                          )),
                                // suffixIcon: Icon(Icons.lock),
                              ),
                              onSaved: (value) {
                                _password = value!;
                              },
                              obscureText: _obsecuretext,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 8)
                                  return 'Enter Valid password';
                                else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            _isloading
                                ? CircularProgressIndicator()
                                : InkWell(
                                    onTap: _Submitform,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      height: 40,
                                      width: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(16),
                                            topLeft: Radius.circular(16),
                                          )),
                                      child: Text(
                                        'Signup',
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              child: Text(
                                'Already have any account ?Signin',
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
