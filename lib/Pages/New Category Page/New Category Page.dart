import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';

class NewCategory_Page extends StatefulWidget {
  const NewCategory_Page({Key? key}) : super(key: key);

  @override
  State<NewCategory_Page> createState() => _NewCategory_PageState();
}

class _NewCategory_PageState extends State<NewCategory_Page> {
  Color? selectedColor;

  List<Color> availableColors = [
    Colors.blue,
    Colors.teal,
    Colors.amber,
    Colors.pinkAccent,
    Colors.grey[300]!,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Row(
              children: [
                Icon(Icons.arrow_back_ios, size: 18),
                SizedBox(width: 10),
                GeneralText(
                  padding: EdgeInsets.zero,
                  text: "New Category",
                  sizetext: 32,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 30),
            GeneralText(
              padding: EdgeInsets.zero,
              text: "Color",
              sizetext: 18,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 15),
            Row(
              children: availableColors.map((color) {
                bool isSelected = selectedColor == color;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                  child: ColorCircle(
                    color: color,
                    isSelected: isSelected,
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedColor != null) {
                    // هنا يمكنك تنفيذ عملية الحفظ
                    print('Selected Color: $selectedColor');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: GeneralText(
                  padding: EdgeInsets.zero,
                  text: "Save",
                  sizetext: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class ColorCircle extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorCircle({
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.blue, width: 3) : null,
        ),
        child: CircleAvatar(
          backgroundColor: color,
          radius: 20,
        ),
      ),
    );
  }
}
