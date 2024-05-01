import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final void Function(String) onChanged;

  const SearchBox({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _textController = TextEditingController();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _showClearButton = _textController.text.isNotEmpty;
    });
  }

  void _clearText() {
    setState(() {
      _textController.clear();
      _showClearButton = false;
      widget.onChanged('');
    });
  }

  void performSearch(String query) {
    widget.onChanged(query);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        onChanged: performSearch,
        controller: _textController,
        style: const TextStyle(color: Colors.black),
        textAlignVertical: TextAlignVertical.center, // Added this line
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          suffixIcon: _showClearButton
              ? IconButton(
                  onPressed: _clearText,
                  icon: const Icon(Icons.clear),
                  color: Colors.grey,
                )
              : const Icon(Icons.search, color: Colors.grey),
          hintText: "Search Here",
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
