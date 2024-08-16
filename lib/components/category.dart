import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final List<String> categories;
  final Color activeColor;
  final Color inactiveColor;
  final Color textColor;
  final Color activeTextColor;
  final bool showBorders;

  CategorySection({
    required this.title,
    required this.categories,
    required this.activeColor,
    required this.inactiveColor,
    required this.textColor,
    required this.activeTextColor,
    this.showBorders = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 16, 
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _CategoryChip(
                  label: category,
                  activeColor: activeColor,
                  inactiveColor: inactiveColor,
                  textColor: textColor,
                  activeTextColor: activeTextColor,
                  showBorders: showBorders,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _CategoryChip extends StatefulWidget {
  final String label;
  final Color activeColor;
  final Color inactiveColor;
  final Color textColor;
  final Color activeTextColor;
  final bool showBorders;

  _CategoryChip({
    required this.label,
    required this.activeColor,
    required this.inactiveColor,
    required this.textColor,
    required this.activeTextColor,
    this.showBorders = true,
  });

  @override
  __CategoryChipState createState() => __CategoryChipState();
}

class __CategoryChipState extends State<_CategoryChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        widget.label,
        style: TextStyle(
          color: isSelected ? widget.activeTextColor : widget.textColor,
        ),
      ),
      selectedColor: widget.activeColor,
      backgroundColor: widget.inactiveColor,
      selected: isSelected,
      shape: widget.showBorders
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: isSelected ? const Color.fromARGB(0, 255, 255, 255) : widget.inactiveColor,
              ),
            )
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide.none,
            ),
      avatar: isSelected
          ? Icon(
              Icons.check,
              color: Colors.white, // Set check-mark color to white
              size: 16,
            )
          : null, // This shows the check-mark when selected
      onSelected: (selected) {
        setState(() {
          isSelected = selected;
        });
      },
    );
  }
}
