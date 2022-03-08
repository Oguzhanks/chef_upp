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
  final bool? lazyError;

  LazyLoadedState({
    required this.data,
    required this.hasReachedMax,
    this.lazyError,
  });

  LazyLoadedState<T> copyWith({
    T? data,
    bool? hasReachedMax,
    bool? lazyError,
  }) =>
      LazyLoadedState(
        data: data ?? this.data,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        lazyError: lazyError ?? this.lazyError,
      );
}

class ErrorState extends BaseState {
  final String error;

  ErrorState(this.error);
}
