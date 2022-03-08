part of 'base_bloc.dart';

@immutable
abstract class BaseState extends Equatable {}

class InitialState extends BaseState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends BaseState {
  @override
  List<Object?> get props => [];
}

class LoadedState<T> extends BaseState {
  final T data;

  LoadedState(this.data);

  @override
  List<Object?> get props => [data];
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

  @override
  List<Object?> get props => [data, hasReachedMax];
}

class ErrorState extends BaseState {
  final String error;

  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
