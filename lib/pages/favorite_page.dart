import 'package:fai_books/model/books.dart';
import 'package:fai_books/model/dbHelper.dart';
import 'package:fai_books/pages/book_box.dart';
import 'package:fai_books/pages/home_page.dart';
import 'package:fai_books/pages/read_later_page.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Books> books = [];

  Future<dynamic> fetchFavorite() async {
    try {
      final bookss = await DBHelper.getAllBooks();
      // List<Books> fetchFavorite = await DBHelper.getAllBooks();
      // books = fetchFavorite;
      setState(() {
        books = bookss;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFavorite();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 216, 61),
        title: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Text(
            "Book",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
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
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
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
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return BookBox(book: book);
        },
      ),
    );
  }
}
