import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneakers_shop/model/export.dart';

part 'bag_bloc.freezed.dart';
part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  List<SneakerInfo> sneakersList = [];
  SneakerInfo? sneakerInfo;
  BagBloc() : super(BagState.loading()) {
    on<BagEvent>(
      (event, emit) {
        event.map(
          loading: (_) {
            emit(BagState.loading());
          },
          loaded: (_) {
            emit(
              BagState.loaded(sneakersList: _.sneakersList),
            );
          },
        );
      },
    );
  }
  Future<void> addSneakerToBag({
    required SneakerInfo sneakerInfo,
  }) async {
    add(BagEvent.loading());
    if (!sneakersList.contains(sneakerInfo)) {
      sneakersList.add(sneakerInfo);
      sneakerInfo.sneakerNumber = 1;
    } else {
      sneakerInfo.sneakerNumber++;
    }
    add(
      BagEvent.loaded(sneakersList: sneakersList),
    );
  }

  void increaseNumber(SneakerInfo sneakerInfo) {
    add(BagEvent.loading());
    sneakerInfo.sneakerNumber++;
    add(
      BagEvent.loaded(sneakersList: sneakersList),
    );
  }

  void removeSneakerNumber({
    required SneakerInfo sneakerInfo,
  }) {
    add(BagEvent.loading());
    sneakerInfo.sneakerNumber--;
    if (sneakerInfo.sneakerNumber == 0) {
      sneakersList.remove(sneakerInfo);

    }
    add(
      BagEvent.loaded(sneakersList: sneakersList),
    );
  }

  double totalPrice() {
    double total = 0;
    for (sneakerInfo in sneakersList) {
      total = (sneakerInfo!.price + total) * sneakerInfo!.sneakerNumber;
    }

    return total;
  }

  void fetchInfo() {
    add(
      BagEvent.loaded(
        sneakersList: sneakersList,
      ),
    );
  }
}
