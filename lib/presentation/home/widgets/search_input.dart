import 'package:catpedia/presentation/home/bloc/home_bloc.dart';
import 'package:catpedia/presentation/home/widget_keys/home_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchInput extends StatelessWidget {
  SearchInput({super.key});

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return TextFormField(
      key: HomePageKeys.searchInput,
      controller: _textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        hintText: l10n.searchPlaceholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        prefixIcon: IconButton(
          key: HomePageKeys.clearSearchInput,
          icon: Icon(Icons.clear),
          onPressed: () {
            final searchText = _textEditingController.text;
            if (searchText.isEmpty) {
              return;
            }
            _textEditingController.clear();
            FocusScope.of(context).unfocus();
            context.read<HomeBloc>().add(ClearSearchEvent());
          },
          color: Theme.of(context).colorScheme.primary,
        ),
        suffixIcon: IconButton(
          key: HomePageKeys.findSearchInput,
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
