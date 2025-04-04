import 'package:catpedia/app.dart';
import 'package:catpedia/data/di.dart';
import 'package:catpedia/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initializeDependencies();
  runApp(
    BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: const CatPediaApp(),
    ),
  );
}
