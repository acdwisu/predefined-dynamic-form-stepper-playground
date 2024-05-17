import 'package:meta/meta.dart';

@immutable
abstract class IState {}

class StateInitial extends IState {}

class StateLoading extends IState {}

class StateLoadingWithData<DataT>
    extends StateLoaded<DataT> implements StateLoading {
  StateLoadingWithData({required super.data});
}

class StateFailed extends IState {
  final String message;

  StateFailed({required this.message});
}

class StateFailedWithData<DataT> extends StateLoaded<DataT> implements StateFailed {
  final String message;

  StateFailedWithData({
    required super.data,
    required this.message,
  });
}

class StateLoaded<DataT> extends IState {
  final DataT data;

  StateLoaded({required this.data});
}
