import 'package:flutter/material.dart';
import 'package:sneakers_shop/shared/styles/export.dart';

class SizeFormat extends StatefulWidget {
  final VoidCallback onChanged;

  const SizeFormat({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<SizeFormat> createState() => _SizeFormatState();
}

class _SizeFormatState extends State<SizeFormat> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              value = 1;
            });
            widget.onChanged.call();
          },
          child: Text(
            'UK',
            style: value == 1
                ? AppTextStyle.black16SemiBold600
                : AppTextStyle.darkGrey16SemiBold600,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              value = 2;
            });
            widget.onChanged.call();
          },
          child: Text(
            'USA',
            style: value == 2
                ? AppTextStyle.black16SemiBold600
                : AppTextStyle.darkGrey16SemiBold600,
          ),
        ),
      ],
    );
  }
}
