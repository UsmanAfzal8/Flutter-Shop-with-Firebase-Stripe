import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttershop/const/globalmethod.dart';
import 'package:fluttershop/loginsignupscreen/googlesign.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class loginScreenui extends StatefulWidget {
  const loginScreenui({Key? key}) : super(key: key);

  @override
  _loginScreenuiState createState() => _loginScreenuiState();
}

class _loginScreenuiState extends State<loginScreenui> {
  final _formkey = GlobalKey<FormState>();
  bool _obsecuretext = true;
  String _emailAddress = '';
  String _password = '';
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
        await _auth
            .signInWithEmailAndPassword(
                email: _emailAddress.toLowerCase().trim(), password: _password)
            .then((value) =>
                Navigator.canPop(context) ? Navigator.pop(context) : null);
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
    final googlesignin = Provider.of<Googlesignin>(context, listen: false);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 210,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  color: Colors.orange.withOpacity(0.3),
                ),
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.transparent,
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  color: Colors.orange.withOpacity(0.3),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Login  page',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
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
                                      'Login',
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
                            onTap: () {
                              Navigator.of(context).pushNamed('/signupScreen');
                            },
                            child: Text(
                              'Don\'t have any account ?Signup',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Or Continue with',
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  googlesignin.Googlelogin();
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/google.png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/facebook.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
