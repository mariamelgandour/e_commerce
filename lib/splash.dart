import 'package:e_commerce/onboarding.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
        
          Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover,
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Icon(
                Icons.shopping_cart,
                size: 150,
                color: const Color.fromARGB(255, 235, 106, 67),
              ),
              
              SizedBox(height: 10),
              
            
              Text(
                'Shop',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              
              
            
        
            ],
          ),
        ],
      ),
    );

  }
}