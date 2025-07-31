import 'package:kiwi/data/exception/error.dart';
import 'package:equatable/equatable.dart';

abstract class GenericState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Initial extends GenericState {}

class InProgress extends GenericState {}

class Success<T> extends GenericState {
  final T? value;

  Success({this.value});

  @override
  List<Object?> get props => [value];
}

class Failure extends GenericState {
  final ErrorMessage error;

  Failure(this.error);

  @override
  List<Object?> get props => [error];
}
