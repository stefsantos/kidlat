import 'package:flutter/material.dart';
import 'package:kidlat/pages/login_page.dart';
import '../../main.dart';

class SignUpPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Container(
                    width: 322,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          'Account Successfully Created',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.50,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Your account has been successfully created. You can now navigate with Kidlat!',
                          style: TextStyle(
                            color: Color(0xFF989898),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.50,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                        print("Proceed to Login Button tapped!");
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Proceed to Login',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                    style: TextButton.styleFrom(
                      elevation: 2,
                      backgroundColor: Colors.amber,
                      minimumSize: Size(350, 48.43),
                      shadowColor: Colors.black.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: Colors.grey.shade600.withOpacity(0.2),
                          width: 1.5,
                        )
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 390,
                      height: 41,
                      padding: EdgeInsets.symmetric(horizontal: 128),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
