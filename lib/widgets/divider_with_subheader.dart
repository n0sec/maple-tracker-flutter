import 'package:flutter/material.dart';

class DividerWithSubheader extends StatelessWidget {
  const DividerWithSubheader({Key? key, required this.subheaderText})
      : super(key: key);

  final String subheaderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            subheaderText,
            style: TextStyle(
              color: Colors.black.withOpacity(0.60),
            ),
          ),
        )
      ],
    );
  }
}
