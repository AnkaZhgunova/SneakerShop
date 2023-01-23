import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakers_shop/presentation/export.dart';
import 'package:sneakers_shop/shared/resources/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom_bar';
  final int initialIndex;
  const BottomBar({
    required this.initialIndex,
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Container(
      color: AppColors.aquamarineCover,
    ),
    Container(
      color: AppColors.blueCover,
    ),
    Container(
      color: AppColors.purpleCover,
    ),
    Container(
      color: AppColors.orangeCover,
    ),
  ];
  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.lightGrey,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.pinkButtons,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.homeIcon,
              color: _selectedIndex == 0
                  ? AppColors.pinkButtons
                  : AppColors.darkGrey,
              height: 34,
              width: 34,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.favoriteIcon,
              color: _selectedIndex == 1
                  ? AppColors.pinkButtons
                  : AppColors.darkGrey,
              height: 32,
              width: 32,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.homeLocationIcon,
              color: _selectedIndex == 2
                  ? AppColors.pinkButtons
                  : AppColors.darkGrey,
              height: 30,
              width: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.shoppingCartIcon,
              color: _selectedIndex == 3
                  ? AppColors.pinkButtons
                  : AppColors.darkGrey,
              height: 32,
              width: 32,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.personIcon,
              color: _selectedIndex == 4
                  ? AppColors.pinkButtons
                  : AppColors.darkGrey,
              height: 30,
              width: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
