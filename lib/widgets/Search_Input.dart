// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchInput extends StatefulWidget {
  static String? freeText;

  const SearchInput({
    Key? key,
  });

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: TextFormField(
          onChanged: (value) {
            setState(() {
              SearchInput.freeText = value;
            });
          },
          style: GoogleFonts.almarai(fontSize: 16),
          decoration: InputDecoration(
              labelText: "بحث ضمن المتطوعين",
              labelStyle: GoogleFonts.almarai(fontSize: 14),
              prefixIcon: const Icon(Icons.search)),
        ),
      ),
    );
  }
}
