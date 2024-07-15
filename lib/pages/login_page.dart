import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kidlat/pages/auth_page.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Method to sign user in
  void signUserIn(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('User signed in: ${userCredential.user}');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
    } catch (e) {
      // Handle error
      print('Error signing in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, 
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 73,
                  height: 61,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/73x61"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height:20),
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.30,
                    ),
                  )
                )
              ),
              // email textfield
              SizedBox(height: 20),
              _buildInputField('Email Address', emailController),
              // password textfield
              SizedBox(height: 10),
              _buildInputField('Password', passwordController, obscureText: true),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {
                    print("Proceed to Login Button tapped!");
                    signUserIn(context);  // Call signUserIn method
                },
                child: Text('Login',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                ),
                style: TextButton.styleFrom(
                  elevation: 2,
                  backgroundColor: Colors.white,
                  minimumSize: Size(350, 48.43),
                  shadowColor: Colors.black.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.grey.shade600.withOpacity(0.2),
                      width: 2,
                    )
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 318,
                height: 1.15,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(
                    width: 198,
                    height: 21,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don’t have an account? ',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 11,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0.15,
                              letterSpacing: -0.08,
                            ),
                          ),
                          TextSpan(
                            text: 'Signup',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0.15,
                              letterSpacing: -0.08,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 118,
                    height: 21,
                    child: Text(
                      'Forgot password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFEB62C),
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.15,
                        letterSpacing: -0.08,
                      ),
                    ),
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

Widget _buildInputField(String hintText, TextEditingController controller, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 17,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.30,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xFFE1E1E1),
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          ),
        ),
      ],
    );
  }
