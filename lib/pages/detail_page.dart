import 'package:fai_books/pages/favorite_page.dart';
import 'package:fai_books/pages/home_page.dart';
import 'package:fai_books/pages/read_later_page.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

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
            icon: Icon(Icons.remove_red_eye),
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[400],
        ),
        child: Column(
          children: [
            Text("Judul"),
            Text(
                "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem "),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Berhasil Di tambahkan"),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
