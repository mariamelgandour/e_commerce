import 'package:flutter/material.dart';


import 'ForgetbyPhone.dart';
import 'RestPassword.dart';  // تأكد من استيراد صفحة ForgetByPhoneScreen

void main() {
  runApp(MaterialApp(
    home: OTPScreen(),
  ));
}

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();

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
                // Icon to go back to ForgetByPhoneScreen
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.grey),
                  onPressed: () {
                    // العودة إلى صفحة ForgetByPhoneScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetByPhoneScreen()),
                    );
                  },
                ),
                SizedBox(height: 20),
                // Title - Enter OTP
                Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                // Description Text
                Text(
                  'Please enter the OTP code sent to your phone number. Please check your number and enter the OTP here.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 30),
                // OTP Input Fields (4 fields)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _otpTextField(otpController1),
                    _otpTextField(otpController2),
                    _otpTextField(otpController3),
                    _otpTextField(otpController4),
                  ],
                ),
                SizedBox(height: 30),
                // Verify Button
                ElevatedButton(
                  onPressed: () {
                    // On pressing the "Verify" button, navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
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
                    "Verify",
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


  Widget _otpTextField(TextEditingController controller) {
    return Container(
      width: 50,
      height: 50,
      child: TextField(
        cursorColor: Colors.deepOrange,
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
        ),
      ),
    );
  }
}

