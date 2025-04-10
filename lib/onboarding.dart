import 'package:e_commerce/login.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingPages = [
    {
      'title': 'Shop Now',
      'description': 'Start your shopping journey today! Explore a wide range of high-quality products – click to shop now!',
      'image': 'images/onboarding1.png',
    },
    {
      'title': 'Big Discount',
      'description': 'Take advantage of huge savings on your favorite products! Don’t miss out, limited time only!',
      'image': 'images/onboarding2.png',
    },
    {
      'title': 'Free Delivery',
      'description': 'Free shipping on everything no minimum required',
      'image': 'images/onboarding3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingPages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                title: onboardingPages[index]['title']!,
                description: onboardingPages[index]['description']!,
                imagePath: onboardingPages[index]['image']!,
              );
            },
          ),

          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingPages.length,
                        (index) => buildDot(index),
                  ),
                ),

                SizedBox(height: 20),

                // Custom button with new design
                GestureDetector(
                  onTap: () {
                    if (_currentPage == onboardingPages.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ], // Add shadow for depth
                    ),
                    child: Text(
                      _currentPage == onboardingPages.length - 1 ? 'Get Start' : 'Next',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      height: 10,
      width: _currentPage == index ? 25 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _currentPage == index
            ? const Color.fromARGB(255, 235, 106, 67)
            : Colors.grey,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),  // Adjust padding for sides
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Image.asset(imagePath, height: 220),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
