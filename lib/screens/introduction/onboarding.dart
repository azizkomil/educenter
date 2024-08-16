import 'package:educenter/components/main_button.dart';
import 'package:educenter/screens/introduction/login.dart';
import 'package:flutter/material.dart';


class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              "O'tkazib yuborish",
              style: TextStyle(color: Color(0xFF545454)), // Change color of "Skip" button
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index; // Update the current page index
                });
              },
              children: [
                // First onboarding page content
                _buildPageContent(
                  "Online ta'lim",
                  "Biz onlayn darslar va oldindan yozib olingan ma'ruzalarni taqdim etamiz.!",
                ),
                // Second onboarding page content
                _buildPageContent(
                  "Istalgan vaqtda o'rganing",
                  "Kelajak uchun ma'ruzalar bron qilingan yoki bir xil",
                ),
                // Third onboarding page content
                _buildPageContent(
                  "Onlayn sertifikat oling",
                  "Ballaringizni tahlil qiling va natijalaringizni kuzatib boring",
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0), // Adjust the space above the button
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIndicator(0),
                    _buildIndicator(1),
                    _buildIndicator(2),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: MainButton(
                  text: _currentPage == 2 ? 'Boshlash' : 'Davom etish',
                  onPressed: () {
                    if (_currentPage == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to build the content of each page
  Widget _buildPageContent(String title, String subtitle) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24, // H1 style
              fontWeight: FontWeight.bold,
              color: Colors.black, // Black color for the title
            ),
          ),
          SizedBox(height: 16), // Space between title and subtitle
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16, // Paragraph style
              color: Color(0xFF545454), // New color for the subtitle
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build the page indicators (dots)
  Widget _buildIndicator(int index) {
    return GestureDetector(
      onTap: () {
        _pageController.jumpToPage(index); // Jump to the tapped page
        setState(() {
          _currentPage = index; // Update the current page index
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        height: 8, // Fixed height
        width: _currentPage == index ? 20 : 12, // Wider when active
        decoration: BoxDecoration(
          color: _currentPage == index
              ? const Color.fromARGB(255, 9, 20, 172) // Active color
              : const Color.fromARGB(129, 9, 66, 172), // Non-active color
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
      ),
    );
  }
}

