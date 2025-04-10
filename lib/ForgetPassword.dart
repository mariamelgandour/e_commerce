import 'package:e_commerce/ForgetbyPhone.dart';
import 'package:e_commerce/RestPassword.dart';
import 'package:e_commerce/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ForgetPasswordScreen(),
  ));
}

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  bool isIconPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: isIconPressed ? Colors.deepOrange : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isIconPressed = !isIconPressed;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),

                SizedBox(height: 20),

                // Title - Forget Password
                Text(
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 20),

                // Description Text
                Text(
                  'Please enter your email address. You will receive a link to create a new password via email.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: 30),

                // Email TextField
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.deepOrange,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: isIconPressed ? Colors.deepOrange : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isIconPressed = !isIconPressed;
                        });
                        emailController.clear();
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Send Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetPasswordScreen()
                      ),
                    ) ;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Send",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 20),

                // "or" text
                Center(
                  child: Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Verify using phone number button
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgetByPhoneScreen()),
                      );
                    },
                    child: Text(
                      "Verify Using Phone Number",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}