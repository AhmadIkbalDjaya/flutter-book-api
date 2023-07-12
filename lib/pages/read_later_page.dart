import 'package:fai_books/pages/book_box.dart';
import 'package:fai_books/pages/favorite_page.dart';
import 'package:fai_books/pages/home_page.dart';
import 'package:flutter/material.dart';

class ReadLaterPage extends StatelessWidget {
  const ReadLaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Text("Book"),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePage(),
                ),
              );
            },
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ReadLaterPage(),
                ),
              );
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.green,
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft:
                Radius.circular(20.0), // Sesuaikan radius sesuai keinginan Anda
            bottomRight:
                Radius.circular(20.0), // Sesuaikan radius sesuai keinginan Anda
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemBuilder: (context, index) => BookBox(),
      // ),
    );
  }
}
