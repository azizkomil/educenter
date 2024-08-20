import 'package:educenter/components/category.dart';
import 'package:flutter/material.dart';
import 'package:educenter/components/search_bar.dart';
import 'package:educenter/components/bottom_nav_bar.dart';
import 'package:educenter/components/home_cards.dart';  // Import the CourseCard component

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Barchasi';
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

  final List<Map<String, String>> _allCourses = [
    {'image': 'lib/images/image1.jpg', 'title': 'Xavfsizlik Texnikasi', 'rating': '4.1', 'category': 'Axborot Xavfsizligi'},
    {'image': 'lib/images/image2.jpg', 'title': 'Tarmoq Xavfsizligi', 'rating': '4.4', 'category': 'Axborot Xavfsizligi'},
    {'image': 'lib/images/image3.jpg', 'title': 'Xavfsizlik Asoslari', 'rating': '5.0', 'category': 'Axborot Xavfsizligi'},
    {'image': 'lib/images/image4.jpg', 'title': 'Mobil Xavfsizlik', 'rating': '4.3', 'category': 'Mobil Pentest'},
    {'image': 'lib/images/image5.jpg', 'title': 'Mobil Hujum', 'rating': '4.5', 'category': 'Mobil Pentest'},
    {'image': 'lib/images/image6.jpg', 'title': 'SIEM Xavfsizligi', 'rating': '4.6', 'category': 'SIEM'},
  ];

  late List<Map<String, String>> _filteredCourses;

  @override
  void initState() {
    super.initState();
    _filteredCourses = _allCourses;
  }

  void _filterCourses() {
    setState(() {
      if (_selectedCategory == 'Barchasi') {
        _filteredCourses = _allCourses.where((course) =>
            course['title']!.toLowerCase().contains(_searchController.text.toLowerCase())
        ).toList();
      } else {
        _filteredCourses = _allCourses
            .where((course) =>
                course['title']!.toLowerCase().contains(_searchController.text.toLowerCase()) &&
                course['category'] == _selectedCategory)
            .toList();
      }
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
      _filterCourses();
    });
  }

  void _onSearchChanged(String query) {
    _filterCourses();
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
      // Add navigation logic here based on index
      // For example, switch to different screens based on _currentIndex
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          onPressed: () {
            // Handle notifications press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Color(0xFF112299)),
            onPressed: () {
              // Handle more options press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Updated Search Bar
              MySearchBar(
                controller: _searchController,
                onChanged: _onSearchChanged,
                onFilterPressed: () {
                  // Handle filter icon press
                },
              ),
              SizedBox(height: 20),
              
              // Categories Section
              Text(
                'Kategoriyalar',
                style: TextStyle(
                  color: Color(0xFF112299),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryChip(
                      label: 'Barchasi',
                      isSelected: _selectedCategory == 'Barchasi',
                      onSelected: _onCategorySelected,
                    ),
                    CategoryChip(
                      label: 'Mobil Pentest',
                      isSelected: _selectedCategory == 'Mobil Pentest',
                      onSelected: _onCategorySelected,
                    ),
                    CategoryChip(
                      label: 'SIEM',
                      isSelected: _selectedCategory == 'SIEM',
                      onSelected: _onCategorySelected,
                    ),
                    CategoryChip(
                      label: 'Axborot Xavfsizligi',
                      isSelected: _selectedCategory == 'Axborot Xavfsizligi',
                      onSelected: _onCategorySelected,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Popular Courses Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mashhur Darsliklar',
                    style: TextStyle(
                      color: Color(0xFF112299),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'Barchasi';
                        _filterCourses();
                      });
                    },
                    child: Text(
                      'Barcha Darsliklar >',
                      style: TextStyle(color: Color(0xFF112299)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Courses Grid
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 5 / 6,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: _filteredCourses.length,
                itemBuilder: (context, index) {
                  return CourseCard(
                    image: _filteredCourses[index]['image']!,
                    title: _filteredCourses[index]['title']!,
                    rating: _filteredCourses[index]['rating']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTapped,
      ),
    );
  }
}
