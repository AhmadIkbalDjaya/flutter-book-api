import 'package:sqflite/sqflite.dart';

class Books {
  int? bookId;
  String? name;
  String? cover;
  String? url;
  List<String>? authors;
  double? rating;
  int? createdEditions;
  int? year;

  Books(
      {this.bookId,
      this.name,
      this.cover,
      this.url,
      this.authors,
      this.rating,
      this.createdEditions,
      this.year});

  Books.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    name = json['name'];
    cover = json['cover'];
    url = json['url'];
    authors = json['authors'].cast<String>();
    rating = json['rating'];
    createdEditions = json['created_editions'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_id'] = this.bookId;
    data['name'] = this.name;
    data['cover'] = this.cover;
    data['url'] = this.url;
    data['authors'] = this.authors;
    data['rating'] = this.rating;
    data['created_editions'] = this.createdEditions;
    data['year'] = this.year;
    return data;
  }

  Books.fromMap(Map<String, dynamic> map) {
    bookId = map['book_id'];
    name = map['name'];
    cover = map['cover'];
    url = map['url'];
    authors = (map['authors'] as String).split(',');
    rating = map['rating'];
    createdEditions = map['created_editions'];
    year = map['year'];
  }

  Map<String, dynamic> toMap() {
    return {
      'book_id': bookId,
      'name': name,
      'cover': cover,
      'url': url,
      'authors': authors?.join(','),
      'rating': rating,
      'created_editions': createdEditions,
      'year': year,
    };
  }

  // Metode untuk melakukan insert ke database
  Future<void> insertToDatabase(Database database) async {
    await database.insert('books', toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

}
