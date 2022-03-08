part of 'base_bloc.dart';

@immutable
abstract class BaseState {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class LoadedState<T> extends BaseState {
  final T data;

  LoadedState(this.data);
}

class LazyLoadedState<T> extends BaseState {
  final T data;
  final bool hasReachedMax;

  LazyLoadedState({
    required this.data,
    required this.hasReachedMax,
  });

  LazyLoadedState<T> copyWith({
    T? data,
    bool? hasReachedMax,
  }) =>
      LazyLoadedState(
        data: data ?? this.data,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );
}

class ErrorState extends BaseState {
  final String error;

  ErrorState(this.error);
}
