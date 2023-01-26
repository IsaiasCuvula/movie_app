import 'package:flutter/material.dart';

import '../../utils/movie_app_theme.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    //_movieProvider.fetchMovies();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: kGrey,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kDarkGrey),
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
          fontSize: 18.0,
          color: Colors.grey.withOpacity(0.4),
        ),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.grey.withOpacity(0.4),
        ),
        border: InputBorder.none,
      ),
    );
  }
}
