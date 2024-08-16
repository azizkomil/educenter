import 'package:flutter/material.dart';
import 'package:educenter/components/category.dart'; // Ensure this path is correct
import 'package:educenter/components/popular_courses.dart'; // Ensure this path is correct
import 'package:educenter/components/search_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensures the background is white
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Asosiy',
          style: TextStyle(
            color: Color(0xFF112299),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.notifications_outlined, color: Color(0xFF112299)),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Color(0xFF112299)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySearchBar(),
              SizedBox(height: 20),
              CategorySection(
                title: 'Kategoriyalar',
                categories: [
                  'Virtual Tahlil',
                  'Kiber Xavf Tahlili',
                  'Cloud Security',
                  'Web Hacking',
                  'Ethical Hacking',
                  'SIEM'
                ],
                activeColor: Color(0xFF112299),
                inactiveColor: Color.fromARGB(166, 215, 228, 250),
                textColor: Colors.black,
                activeTextColor: Colors.white,
                showBorders: true,
              ),
              SizedBox(height: 20),
              PopularCoursesSection(
                title: 'Mashhur Darsliklar',
                courses: [
                  'Barchasi',
                  'Mobil Pentest',
                  'SIEM',
                  'Axborot Xavfsizligi',
                ],
                activeColor: Color(0xFF112299),
                inactiveColor: Color.fromARGB(166, 215, 228, 250),
                textColor: Colors.black,
                activeTextColor: Colors.white,
                showBorders: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
