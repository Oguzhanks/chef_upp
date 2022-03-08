import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'base_service.dart';

part 'base_state.dart';

abstract class BaseBloc<Event, TService extends BaseService> extends Bloc<Event, BaseState> {
  final TService service;

  BaseBloc(this.service) : super(InitialState());
}
