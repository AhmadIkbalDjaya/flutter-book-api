import 'package:fai_books/pages/book_box.dart';
import 'package:fai_books/pages/favorite_page.dart';
import 'package:fai_books/pages/read_later_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
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
              bottomLeft: Radius.circular(
                  20.0), // Sesuaikan radius sesuai keinginan Anda
              bottomRight: Radius.circular(
                  20.0), // Sesuaikan radius sesuai keinginan Anda
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                padding: EdgeInsets.only(left: 5, right: 25),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return BookBox();
            }
          },
        )
        // Column(
        //   children: [
        //     // search box
        //     Container(
        //       margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //       padding: EdgeInsets.only(left: 5, right: 25),
        //       decoration: BoxDecoration(
        //         color: Colors.grey[400],
        //         borderRadius: BorderRadius.circular(25),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.grey,
        //             spreadRadius: 2,
        //             blurRadius: 1,
        //           ),
        //         ],
        //       ),
        //       child: Row(
        //         children: [
        //           IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        //           Expanded(
        //             child: TextField(
        //               decoration: InputDecoration(
        //                 border: InputBorder.none,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     // end search box
        //     BookBox(),
        //   ],
        // ),
        );
  }
}
