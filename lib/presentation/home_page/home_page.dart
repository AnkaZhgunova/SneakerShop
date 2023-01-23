import 'package:flutter/material.dart';
import 'package:sneakers_shop/model/export.dart';
import 'package:sneakers_shop/presentation/export.dart';
import 'package:sneakers_shop/shared/resources/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';
import 'package:sneakers_shop/shared/ui_kit/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> sneakersBrand = [
    'Nike',
    'Addidas',
    'Jordan',
    'Puma',
    'Reebok',
  ];

  final List<String> sneakersCategory = [
    'New',
    'Featured',
    'Upcoming',
  ];

  int selectedBrand = 0;
  int selectedCategory = 1;
  MockData mockData = MockData();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.white,
            AppColors.lightGrey,
          ],
        ),
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Discover',
                  style: AppTextStyle.black30Bold700,
                ),
                Spacer(),
                SquareButton(
                  onTap: () {},
                  icon: AppIcons.searchIcon,
                ),
                SizedBox(
                  width: 10,
                ),
                SquareButton(
                  onTap: () {},
                  icon: AppIcons.notificationsIcon,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  itemCount: sneakersBrand.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedBrand = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(8),
                        color:
                            selectedBrand == index ? AppColors.lightGrey : null,
                        child: Text(
                          sneakersBrand[index],
                          style: selectedBrand == index
                              ? AppTextStyle.black16SemiBold600
                              : AppTextStyle.darkGrey16SemiBold600,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  SneakerSlider(),
                  RotatedBox(
                    quarterTurns: -1,
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: sneakersCategory.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                sneakersCategory[index],
                                style: selectedCategory == index
                                    ? AppTextStyle.black16SemiBold600
                                    : AppTextStyle.darkGrey16SemiBold600,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More',
                      style: AppTextStyle.black20Bold500,
                    ),
                    AppIconButton(onTap: () {}, buttonType: ButtonIcon.arrow),
                  ],
                ),
              ),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  itemCount: 4,
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (child, index) {
                    if (index == 2 || index == 3) {
                      return NewModelCard(
                        sneakerInfo: mockData.sneakerData[index],
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
