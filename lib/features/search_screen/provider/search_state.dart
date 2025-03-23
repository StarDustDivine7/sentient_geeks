import 'package:equatable/equatable.dart';

import '../response/search_response_model.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchResponseModel searchResponse;

  SearchLoaded({required this.searchResponse});

  @override
  List<Object?> get props => [searchResponse];
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});

  @override
  List<Object?> get props => [message];
}
