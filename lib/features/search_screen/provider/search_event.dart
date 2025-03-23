import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchSearchResults extends SearchEvent {
  final String query;

  FetchSearchResults({required this.query});

  @override
  List<Object?> get props => [query];
}
