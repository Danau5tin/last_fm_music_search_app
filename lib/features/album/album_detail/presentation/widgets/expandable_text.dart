import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText(this.text, {Key? key}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  String get _text => widget.text;

  int get maxNumUnExpandedChars => 195;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GestureDetector(
          onTap: _alterSize,
          child: RichText(
            key: const ValueKey("expandableRichText"),
            text: TextSpan(
              text: _getDisplayedText,
              style: _textTheme(context),
              children: <TextSpan>[
                if (_text.length >= maxNumUnExpandedChars)
                  _buildLessMoreText(context),
              ],
            ),
          ),
        ));
  }

  String get _getDisplayedText {
    return _expanded
        ? _text
        : _text.substring(
            0,
            _text.length < maxNumUnExpandedChars
                ? _text.length - 1
                : maxNumUnExpandedChars);
  }

  TextSpan _buildLessMoreText(BuildContext context) {
    return TextSpan(
        text: _expanded ? " less..." : ' read more...',
        style: TextStyle(
            color: Colors.grey, fontSize: _textTheme(context)!.fontSize! + 1));
  }

  TextStyle? _textTheme(BuildContext context) =>
      Theme.of(context).textTheme.bodyText1;

  void _alterSize() {
    if (_text.length < maxNumUnExpandedChars) return;
    setState(() {
      _expanded = !_expanded;
    });
  }
}
