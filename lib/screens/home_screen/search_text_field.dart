import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';
import '../../utils/movie_app_theme.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController _textEditingController;
  late MovieProvider _movieProvider;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      cursorColor: Colors.white,
      onChanged: (keyword) {
        _movieProvider.getFilteredList(keyword);
      },
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
