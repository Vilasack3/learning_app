abstract class HomePageEvent {
  HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  final int index;

  HomePageDots(this.index);
}
