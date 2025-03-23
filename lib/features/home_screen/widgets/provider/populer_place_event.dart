abstract class PopularPlaceEvent {}

class SelectPlaceEvent extends PopularPlaceEvent {
  final int selectedIndex;
  SelectPlaceEvent(this.selectedIndex);
}
