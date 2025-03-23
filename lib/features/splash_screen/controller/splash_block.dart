import 'dart:async';

import '../../../core/exports.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  late AnimationController controller;
  late Animation<double> positionAnimation;
  late double maxTravelPosition;
  bool textVisible = false;

  SplashBloc({TickerProvider? vsync, BuildContext? context})
    : super(SplashInitial()) {
    maxTravelPosition = MediaQuery.of(context!).size.width - 56;

    controller = AnimationController(
      vsync: vsync!,
      duration: const Duration(milliseconds: 2000),
    );

    positionAnimation = Tween<double>(
      begin: 0,
      end: maxTravelPosition - 20,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.addListener(() {
      add(StartAnimation());
    });

    on<StartAnimation>((event, emit) {
      emit(
        SplashAnimating(
          position: positionAnimation.value,
          textVisible: textVisible,
        ),
      );
    });

    on<ReverseAnimation2>((event, emit) {
      controller.reverse();
    });

    on<ShowText>((event, emit) {
      textVisible = true;
      emit(
        SplashAnimating(
          position: positionAnimation.value,
          textVisible: textVisible,
        ),
      );
    });

    on<SplashFinished>((event, emit) {
      emit(SplashCompleted());
    });

    startSplash();
  }

  void startSplash() {
    Future.delayed(Duration.zero, () {
      controller.forward();
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      add(ShowText());
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          add(ReverseAnimation2());
        });
      } else if (status == AnimationStatus.dismissed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          add(SplashFinished());
        });
      }
    });
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}

// class SplashBloc extends Bloc<SplashEvent, SplashState> {
//   late AnimationController _controller;
//   late Animation<double> _positionAnimation;
//   late Animation<double> _fadeAnimation;
//   SplashBloc() : super(SplashInitial());
//
//   void initialize(TickerProvider vsync) {
//     _controller = AnimationController(
//       vsync: vsync,
//       duration: Duration(seconds: 2),
//     );
//
//     _positionAnimation = Tween<double>(
//       begin: -100,
//       end: 100,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//
//     _fadeAnimation = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
//
//     _controller.addListener(() {
//       add(StartAnimationEvent());
//     });
//   }
//
//   Stream<SplashState> mapEventToState(SplashEvent event) async* {
//     if (event is StartAnimationEvent) {
//       yield SplashAnimating(_positionAnimation.value, _fadeAnimation.value);
//     }
//   }
//
//   void startAnimation() {
//     _controller.forward();
//   }
//
//   void reverseAnimation() {
//     _controller.reverse();
//   }
//
//   @override
//   Future<void> close() {
//     _controller.dispose();
//     return super.close();
//   }
// }
