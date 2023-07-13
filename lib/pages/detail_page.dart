import 'package:fai_books/controller/BookController.dart';
import 'package:fai_books/model/bookdetails.dart';
import 'package:fai_books/model/books.dart';
import 'package:fai_books/pages/favorite_page.dart';
import 'package:fai_books/pages/home_page.dart';
import 'package:fai_books/pages/read_later_page.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.id});
  final String id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final bookController = BookController();

  BookDetails? book;

  @override
  Future<BookDetails> fetchBook(String id) async {
    try {
      BookDetails bookfetch = await bookController.bookDetail(id);
      return bookfetch;
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
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
              color: Colors.black,
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
      body: FutureBuilder<BookDetails>(
        future: fetchBook(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  CircularProgressIndicator(), // Tampilkan indikator loading saat future sedang diload
            );
          } else if (snapshot.hasError) {
            return Text('Error loading data: ${snapshot.error}');
          } else {
            final book = snapshot.data;
            if (book != null) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 216, 61),
                ),
                child: ListView(
                  children: [
                    Text(
                      "${book.name}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${book.synopsis}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 25,
                    ),
                  ],
                ),
              );
            } else {
              return Text('Book not found');
            }
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           title: Text("Berhasil Di tambahkan"),
      //         );
      //       },
      //     );
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
