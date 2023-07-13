import 'package:fai_books/controller/BookController.dart';
import 'package:fai_books/model/books.dart';
import 'package:fai_books/model/dbHelper.dart';
import 'package:fai_books/pages/book_box.dart';
import 'package:fai_books/pages/favorite_page.dart';
import 'package:fai_books/pages/read_later_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final bookController = BookController();
  List<Books> books = [];

  Future<void> searchBooks(String name) async {
    try {
      List<Books> fetchBooks = await bookController.searchBook(name);
      setState(() {
        books = fetchBooks;
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey[400],
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
      body: ListView.builder(
        itemCount: books.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              padding: EdgeInsets.only(left: 5, right: 25),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 241, 233),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (searchController.text == '') {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Search Wajib di Isi"),
                          ),
                        );
                      } else {
                        searchBooks(searchController.text);
                      }
                    },
                    icon: Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            if (books.length != 0) {
              var book = books[index - 1];
              return Stack(
                children: [
                  BookBox(book: book),
                  Positioned(
                    bottom: 10,
                    right: 20,
                    child: IconButton(
                      onPressed: () async {
                        try {
                          var result = await DBHelper.insertBook(book);
                          if (result) {
                            // return showDialog(
                            //   context: context,
                            //   builder: (context) => AlertDialog(
                            //     title: Text("Succes add to Favorite"),
                            //   ),
                            return showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        width: 200,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.8),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Succes add to Favorite",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ));
                          }
                        } catch (e) {
                          return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("error"),
                            ),
                          );
                        }
                      },
                      icon: Icon(Icons.favorite),
                    ),
                  ),
                ],
              );
            } else {
              Text("Cari Buku");
            }
          }
        },
      ),
    );
  }
}
