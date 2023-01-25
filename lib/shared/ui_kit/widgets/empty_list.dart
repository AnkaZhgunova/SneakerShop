import 'package:flutter/material.dart';
import 'package:sneakers_shop/shared/styles/export.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Text(
            'List is empty 😒',
            style: AppTextStyle.black20Bold500,
          ),
        ],
      ),
    );
  }
}
