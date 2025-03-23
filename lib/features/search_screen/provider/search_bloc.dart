import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sentiangreeks_task/features/search_screen/provider/search_event.dart';
import 'package:sentiangreeks_task/features/search_screen/provider/search_state.dart';

import '../../../core/exports.dart';
import '../response/search_response_model.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<FetchSearchResults>(_onFetchSearchResults);
  }

  Future<void> _onFetchSearchResults(
    FetchSearchResults event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/posts/search?q=${event.query}'),
      );

      if (response.statusCode == 200) {
        // debugPrint(response.body);
        final data = json.decode(response.body);
        final searchResponse = SearchResponseModel.fromJson(data);
        emit(SearchLoaded(searchResponse: searchResponse));
      } else {
        emit(SearchError(message: "Failed to fetch data"));
      }
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
