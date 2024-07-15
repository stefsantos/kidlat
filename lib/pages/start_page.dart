import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kidlat/pages/SignUp/SignUp.dart';
import 'package:kidlat/pages/login_page.dart';



class LoginPage extends StatelessWidget {
  @override
  const LoginPage({super.key});


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
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
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 274,
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      'Ready to Charge Up?',
                      style: TextStyle(
                        color: Color(0xFF303E44),
                        fontSize: 40,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 446,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x4C000000),
                      blurRadius: 5,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 37),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              print("login button pressed");
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => LoginPage())
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size(double.infinity, 60),
                              shadowColor: Colors.black.withOpacity(0.2),
                              backgroundColor: Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(
                                  color: Colors.grey.shade600.withOpacity(0.2),
                                  width: 1.5,
                                )
                              ),
                            ),
                          ),
                        ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              print("create acc button pressed");
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => SignUpPage())
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size(double.infinity, 60),
                              shadowColor: Colors.black.withOpacity(0.2),
                              backgroundColor: Color.fromRGBO(254, 182, 44, 1.0),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(
                                  color: Colors.grey.shade600.withOpacity(0.2),
                                  width: 1.5,
                                )
                              ),
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}