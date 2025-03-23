import 'package:sentiangreeks_task/features/home_screen/widgets/provider/populer_place_event.dart';
import 'package:sentiangreeks_task/features/home_screen/widgets/provider/populer_place_state.dart';

import '../../../../core/exports.dart';

class PopularPlaceBloc extends Bloc<PopularPlaceEvent, PopularPlaceState> {
  PopularPlaceBloc() : super(PopularPlaceState()) {
    on<SelectPlaceEvent>((event, emit) {
      emit(PopularPlaceState(selectedIndex: event.selectedIndex));
    });
  }
}
