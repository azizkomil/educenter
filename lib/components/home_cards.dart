import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String image;
  final String title;
  final String rating;

  const CourseCard({
    required this.image,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 20,  // Adjust width to fit 3 cards in a row with spacing
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 145,  // Adjust height to make the card more compact
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 15, 0, 0),
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF112299),
                fontWeight: FontWeight.bold,
                fontSize: 18,  // Smaller font size to fit in one line
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,  // Ensure the title doesn't overflow
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
            child: Text(
              'Reyting: $rating',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,  // Smaller font size for the rating
              ),
            ),
          ),
          SizedBox(height: 8),  // Add some spacing at the bottom
        ],
      ),
    );
  }
}
