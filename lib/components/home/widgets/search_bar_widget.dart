import 'package:flutter/material.dart';

class MySearchBarWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const MySearchBarWidget({Key? key, required this.onChanged})
      : super(key: key);

  @override
  _MySearchBarWidgetState createState() => _MySearchBarWidgetState();
}

class _MySearchBarWidgetState extends State<MySearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  void _onClear() {
    _controller.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          icon: Icon(Icons.search),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _onClear,
                )
              : null,
        ),
      ),
    );
  }
}
