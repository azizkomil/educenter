import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asosiy'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Qidirish...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Categories and Popular Courses
            Expanded(
              child: ListView(
                children: [
                  // Categories
                  Text(
                    'Kategoriyalar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Add your category widgets here
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Popular Courses
                  Text(
                    'Mashhur Darsliklar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Center(child: Text('Course $index')),
                      );
                    },
                    itemCount: 8, // Number of courses to display
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Asosiy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Kurslarim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Yangiliklar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Sevimlilar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Color(0xFF112299), // Match your theme color
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
