import 'package:fai_books/model/books.dart';
import 'package:fai_books/model/dbHelper.dart';
import 'package:fai_books/pages/detail_page.dart';
import 'package:flutter/material.dart';

class BookBox extends StatelessWidget {
  const BookBox({super.key, required this.book});
  final Books book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      padding: EdgeInsets.only(right: 50, left: 50, top: 15),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(id: book.bookId.toString()),
                ),
              );
            },
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.network(
                      '${book.cover}', // Ganti dengan URL gambar Anda
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 50),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${book.name}"),
                        SizedBox(height: 15),
                        Text("${book.authors}"),
                        SizedBox(height: 15),
                        Text("${book.year}"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  try {
                    var result = await DBHelper.insertBook(book);
                    if (result) {
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("success"),
                        ),
                      );
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
            ],
          ),
        ],
      ),
    );
  }
}
