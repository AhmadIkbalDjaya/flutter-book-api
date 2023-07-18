import 'dart:convert';
import 'dart:io';
import 'package:fai_books/model/bookdetails.dart';
import 'package:fai_books/model/books.dart';
import 'package:http/http.dart' as http;

final link = "https://hapi-books.p.rapidapi.com";

class BookController {
  Future<List<Books>> searchBook(String query) async {
    var url = Uri.parse("${link}/search/${query}");
    // aid
    // var response = await http.get(url, headers: {
    //   "X-RapidAPI-Key": "80acae05c0msha9cffe430735355p153ecdjsn43b3cf277656",
    //   "X-RapidAPI-Host": "hapi-books.p.rapidapi.com"
    // });
    // trycath
    // var response = await http.get(url, headers: {
    //   'X-RapidAPI-Key': 'e3e11eacd4mshbcee4b1b5b2452fp11803ajsne99b37360fe6',
    //   'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
    // });
    // sman17
    var response = await http.get(url, headers: {
      'X-RapidAPI-Key': 'db46983a94mshd11512976392913p1adff9jsn0c090a2bfd80',
      'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
    });

    print(response.body);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var bookList = jsonData as List<dynamic>;
      var books = bookList.map((json) => Books.fromJson(json)).toList();
      print(books);
      return books;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  Future<BookDetails> bookDetail(String id) async {
    var url = Uri.parse("${link}/book/${id}");
    // aid
    // var response = await http.get(url, headers: {
    //   "X-RapidAPI-Key": "80acae05c0msha9cffe430735355p153ecdjsn43b3cf277656",
    //   "X-RapidAPI-Host": "hapi-books.p.rapidapi.com"
    // });
    // trycatg
    // var response = await http.get(url, headers: {
    //   'X-RapidAPI-Key': 'e3e11eacd4mshbcee4b1b5b2452fp11803ajsne99b37360fe6',
    //   'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
    // });
    // sman17
    var response = await http.get(url, headers: {
      'X-RapidAPI-Key': 'db46983a94mshd11512976392913p1adff9jsn0c090a2bfd80',
      'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
    });
    print(response.body);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var book = BookDetails.fromJson(jsonData);
      return book;
    } else {
      throw Exception("failed load Profile");
    }
  }
}
