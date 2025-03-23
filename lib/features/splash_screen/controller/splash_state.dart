abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashAnimating extends SplashState {
  final double position;
  final bool textVisible;

  SplashAnimating({required this.position, required this.textVisible});
}

class SplashCompleted extends SplashState {}
