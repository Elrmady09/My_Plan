import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Header/Header.dart';


class Category {
  final String name;
  final Color color;

  Category({required this.name, required this.color});
}


class Categories_Page extends StatelessWidget {
   Categories_Page({Key? key}) : super(key: key);




  final List<Category> categories = [
    Category(name: 'Sports', color: Colors.green),
    Category(name: 'work', color: Colors.blue),
    Category(name: 'Education', color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header_Task(
              titel: 'Categories',
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              itemCount: categories.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: category.color,
                    radius: 10,
                  ),
                  title: GeneralText(
                    text: category.name,
                    sizetext: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GeneralText(
                        text: 'Edit',
                        sizetext: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline, color: Colors.redAccent),
                        onPressed: () {
                          // تنفيذ الحذف
                          // showDialog للتأكيد مثلاً
                        },
                      ),
                    ],
                  ),
                  onTap: (){
                    Navigator.pop(context, category.name);
                  },
                );
              },
            ),
            Container(
              width:size.width * 0.38 ,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.blue,
                  width: 1.5
                )
              ),
              child: Center(
                child: GeneralText(
                  text: 'Add Category',
                  sizetext: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
