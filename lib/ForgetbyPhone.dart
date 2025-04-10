import 'package:e_commerce/ForgetPassword.dart';
import 'package:flutter/material.dart';

import 'otp.dart';

void main() {
  runApp(MaterialApp(
    home: ForgetByPhoneScreen(),
  ));
}

class ForgetByPhoneScreen extends StatefulWidget {
  @override
  _ForgetByPhoneScreenState createState() => _ForgetByPhoneScreenState();
}

class _ForgetByPhoneScreenState extends State<ForgetByPhoneScreen> {
  TextEditingController phoneController = TextEditingController();

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
                // Icon back to VerifyUsingPhoneScreen
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgetPasswordScreen()
                    ),
                    ) ;
                  },
                ),
                SizedBox(height: 20),
                // Title - Enter Phone Number
                Text(
                  'Enter Phone Number',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                // Description Text
                Text(
                  'Please enter your phone number. You will receive a link to create a new password via SMS.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 30),
                // Phone Number TextField
                TextFormField(
                  controller: phoneController,
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                  ),
                ),
                SizedBox(height: 20),
                // Send Button
                ElevatedButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OTPScreen()),
                    );
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}


