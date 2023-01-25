import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneakers_shop/model/sneaker_info/sneaker_info.dart';

part 'buy_sneaker_bloc.freezed.dart';
part 'buy_sneaker_event.dart';
part 'buy_sneaker_state.dart';

class BuySneakerBloc extends Bloc<BuySneakerEvent, BuySneakerState> {
  List<SneakerInfo> sneakersList = [];
  SneakerInfo? sneakerInfo;
  BuySneakerBloc() : super(BuySneakerState.loading()) {
    on<BuySneakerEvent>(
      (event, emit) {
        event.map(
          loading: (_) {
            BuySneakerState.loading();
          },
          loaded: (_) {
            BuySneakerState.loaded(sneakersList: _.sneakersList);
          },
        );
      },
    );
  }
  Future<void> addSneakerToBag(SneakerInfo sneakerInfo) async {
    sneakerInfo.sneakerNumber++;
    if (sneakerInfo.sneakerNumber == 1) {
      sneakersList.add(sneakerInfo);
    }
    add(
      BuySneakerEvent.loaded(sneakersList: sneakersList),
    );
  }

  void fetchInfo() {
    add(
      BuySneakerEvent.loaded(
        sneakersList: sneakersList,
      ),
    );
  }

  void removeSneakerNumber() {
    sneakerInfo?.sneakerNumber--;
    if (sneakerInfo?.sneakerNumber == 0) {
      sneakersList.remove(sneakerInfo);
    }
    add(
      BuySneakerEvent.loaded(sneakersList: sneakersList),
    );
  }
}
