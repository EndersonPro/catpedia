import 'package:catpedia/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchInput extends StatelessWidget {
  SearchInput({super.key});

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        hintText: 'Search for a cat breed',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            FocusScope.of(context).unfocus();
            final searchText = _textEditingController.text;
            context.read<HomeBloc>().add(
              SearchingEvent(searchText: searchText),
            );
          },
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
