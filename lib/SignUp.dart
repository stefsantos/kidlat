import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Signup',
                    style: TextStyle(
                      color: Color(0xFF303E44),
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.30,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Create a new account',
                    style: TextStyle(
                      color: Color(0xFF2A2A2A),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.50,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Username',
                style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.50,
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your username',
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
              SizedBox(height: 20),
              Text(
                'Email',
                style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.50,
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
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
              SizedBox(height: 20),
              Text(
                'Name',
                style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.50,
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
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
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: Material(
                  color: Colors.transparent, // Makes the Material widget transparent
                  child: InkWell(
                    onTap: () {
                      // Add your onTap functionality here
                     
                    },
                    borderRadius: BorderRadius.circular(30), 
                    splashColor: Colors.yellow.withOpacity(0.2), 
                    highlightColor: Colors.yellow.withOpacity(0.1),
                    child: Container(
                      width: 117,
                      height: 42,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x1E000000),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                    ),
                  ),
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
