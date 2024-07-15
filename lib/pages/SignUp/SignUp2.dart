import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'SignUp3.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';


class SignUpPage2 extends StatefulWidget {
  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  bool isChecked = false;
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? selectedGender;

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
              _buildInputField('Mobile Number', '+63 | Phone Number', mobileController),
              SizedBox(height: 20),
              _buildInputField('Password', 'Enter your password', passwordController, obscureText: true),
              SizedBox(height: 20),
              _buildInputField('Confirm Password', 'Re-enter your password', confirmPasswordController, obscureText: true),
              SizedBox(height: 20),
              Text(
                'Gender',
                style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.50,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 52.17,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      color: Color(0xFFE1E1E1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GenderDropdown(
                    selectedGender: selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 350,
                  height: 24,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isChecked,
                          activeColor: Color.fromRGBO(254, 182, 44, 1.0),
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked = newValue!;
                              print(isChecked);
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            'Agree to the terms of use and privacy policy',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 350,
                  height: 48.43,
                  decoration: ShapeDecoration(
                    color: Color.fromRGBO(254, 182, 44, 1.0),
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
                  child: TextButton(
                    onPressed: () {
                      print("Create Account Button tapped!");

                      if (isChecked && _validateFields()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage3()),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "All fields must be filled and terms must be agreed to proceed.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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

  Widget _buildInputField(String label, String hintText, TextEditingController controller, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
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

  bool _validateFields() {
    return mobileController.text.isNotEmpty &&
           passwordController.text.isNotEmpty &&
           confirmPasswordController.text.isNotEmpty &&
           selectedGender != null;
  }
}

class GenderDropdown extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String?>? onChanged;

  GenderDropdown({this.selectedGender, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedGender,
      hint: Text('Select your gender'),
      isExpanded: true,
      underline: SizedBox(),
      borderRadius: BorderRadius.circular(12),
      items: <String>['Male', 'Female'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
