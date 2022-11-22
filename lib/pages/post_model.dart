import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'post_model.dart';


Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=search+terms'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}




List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

class Post {
  Post({
    required this.title,
    required this.author,
    required this.genre,
    required this.resumate,
  });

  String title;
  String author;
  String genre;
  String resumate;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        title: json["Titre"],
        author: json["Auteur"],
        genre: json["Genre"],
        resumate: json["Résumé"],
      );
}