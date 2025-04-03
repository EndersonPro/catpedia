import 'package:catpedia/app.dart';
import 'package:catpedia/data/di.dart';
import 'package:flutter/material.dart';

void main() {
  initializeDependencies();
  runApp(const CatPediaApp());
}
