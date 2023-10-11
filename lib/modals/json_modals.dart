import 'package:flutter/material.dart';

class JsonModals {
  final int chapter_id;
  final int verse_number;
  final String text;
  final String transliteration;

  JsonModals({
    required this.chapter_id,
    required this.verse_number,
    required this.text,
    required this.transliteration,
  });

  factory JsonModals.fromMap({required Map data}) {
    return JsonModals(
      chapter_id: data['chapter_id'],
      verse_number: data['verse_number'],
      text: data['text'],
      transliteration: data['transliteration'],
    );
  }

  List FavouriteList = [];
}
