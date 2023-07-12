import 'package:fai_books/pages/detail_page.dart';
import 'package:flutter/material.dart';

class BookBox extends StatelessWidget {
  const BookBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
            ),
            SizedBox(width: 50),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Judul"),
                  SizedBox(height: 15),
                  Text("Penulis"),
                  SizedBox(height: 15),
                  Text("Tahun Terbit"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
