import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final void Function(String) onChanged;

  SearchBox({
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
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: performSearch,
        controller: _textController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffixIcon: _showClearButton
              ? IconButton(
                  onPressed: _clearText,
                  icon: const Icon(Icons.clear),
                )
              : const Icon(Icons.search),
          hintText: "Search here",
        ),
      ),
    );
  }
}
