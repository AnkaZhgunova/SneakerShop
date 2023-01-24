import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_shop/shared/resources/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';

class SizeChoice extends StatefulWidget {
  const SizeChoice({Key? key}) : super(key: key);

  @override
  State<SizeChoice> createState() => _SizeChoiceState();
}

class _SizeChoiceState extends State<SizeChoice> {
  int? _selected;

  TextStyle textStyle = AppTextStyle.black14SemiBold600;
  Color iconColor = AppColors.black;
  List<Widget> options = [];
  @override
  void initState() {
    options = [
      Row(
        children: [
          Text(
            'Try it',
            style: textStyle,
          ),
          SizedBox(
            width: 5,
          ),
          SvgPicture.asset(
            AppIcons.footPrintIcon,
            fit: BoxFit.scaleDown,
            height: 30,
            width: 30,
            color: iconColor,
          ),
        ],
      ),
      Center(
        child: Text(
          '7.5',
          style: textStyle,
        ),
      ),
      Center(
        child: Text(
          '8',
          style: textStyle,
        ),
      ),
      Center(
        child: Text(
          '9.5',
          style: textStyle,
        ),
      ),
    ];

    super.initState();
  }

  Widget _optionButton(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = index;
        });
      },
      child: Container(
        width: 90,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: _selected == index ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.grey,
          ),
        ),
        child: options[index],
      ),
    );
  }

  List<Widget> _buildOptions() {
    final List<Widget> widgets = [];
    for (int index = 0; index < options.length; index++) {
      widgets.add(_optionButton(index));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: _buildOptions(),
    );
  }
}
