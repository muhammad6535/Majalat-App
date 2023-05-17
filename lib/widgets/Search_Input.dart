// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final ValueChanged<String> onSearchQueryChanged;

  const SearchInput({Key? key, required this.onSearchQueryChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'ابحث عن متطوع',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: onSearchQueryChanged,
      ),
    );
  }
}
