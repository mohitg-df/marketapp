import 'package:flutter/material.dart';

class WSSearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const WSSearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _WSSearchWidgetState createState() => _WSSearchWidgetState();
}

class _WSSearchWidgetState extends State<WSSearchWidget> {
  final _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      margin: const EdgeInsets.fromLTRB(30, 16, 30, 16),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: _searchcontroller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
            child: Icon(Icons.close, color: style.color),
            onTap: () {
              _searchcontroller.clear();
              widget.onChanged('');
              FocusScope.of(context).requestFocus(FocusNode());
            },
          )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: UnderlineInputBorder(),
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
