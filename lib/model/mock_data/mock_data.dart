import 'package:sneakers_shop/model/export.dart';
import 'package:sneakers_shop/shared/resources/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';

class MockData {
  final List<SneakerInfo> sneakerData = [
    SneakerInfo(
      name: 'EPIC-REACT',
      brand: 'NIKE',
      price: '130.00',
      image: AppImages.firstSneaker,
      color: AppColors.orangeCover,
    ),
    SneakerInfo(
      name: 'AIR-MAX',
      brand: 'NIKE',
      price: '130.00',
      image: AppImages.secondSneaker,
      color: AppColors.blueCover,
    ),
    SneakerInfo(
      name: 'AIR-270',
      brand: 'NIKE',
      price: '150.00',
      image: AppImages.thirdSneaker,
      color: AppColors.greenCover,
    ),
    SneakerInfo(
      name: 'EPIC-REACT',
      brand: 'NIKE',
      price: '130.00',
      image: AppImages.fourthSneaker,
      color: AppColors.pinkCover,
    ),
  ];
}
