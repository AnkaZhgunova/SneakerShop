part of 'bag_bloc.dart';

@freezed
class BagState with _$BagState {
  const factory BagState.loading({List<SneakerInfo>? sneakersList}) =
      BagStateLoading;

  const factory BagState.loaded({List<SneakerInfo>? sneakersList}) =
      BagStateLoaded;
}
