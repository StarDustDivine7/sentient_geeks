import 'package:flutter/cupertino.dart';

import '../../core/exports.dart';
import '../nav_screen/nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  bool textVisible = false;
  double maxTravelPosition = 200; // Assign a default value

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _positionAnimation = Tween<double>(
      begin: 0,
      end: maxTravelPosition - 20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          _controller.reverse();
        });
      }
      if (_controller.status == AnimationStatus.dismissed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) {
                  return NavScreen();
                },
              ),
            );
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(builder: (context) => NavScreen()),
            // );
          }
        });
      }
    });

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          maxTravelPosition = MediaQuery.of(context).size.width - 56;

          _positionAnimation = Tween<double>(
            begin: 0,
            end: maxTravelPosition - 20,
          ).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
          );
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          textVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(gradient: AppColors.splashScreenGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Positioned(
                        left: _positionAnimation.value,
                        child: Image.asset(
                          "${ImageConstant.iconPath}/globe icon.png",
                          width: 36,
                          height: 36,
                          color: AppColors.whiteColor,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: screenWidth / 2.7,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1500),
                      opacity: textVisible ? 1 : 0,
                      child: Text(
                        "Travel",
                        style: CustomTextStyle.lobsterRegular(
                          fontSize: 44,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            gapH32,
            Text(
              "Find Your Dream\nDestination With Us",
              textAlign: TextAlign.center,
              style: CustomTextStyle.robotoRegular(
                fontSize: 20,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import '../../core/exports.dart';
// import 'controller/splash_block.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late SplashBloc _splashBloc;
//
//   @override
//   void initState() {
//     super.initState();
//     _splashBloc = SplashBloc(vsync: this, context: context);
//   }
//
//   @override
//   void dispose() {
//     _splashBloc.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//
//     return BlocProvider(
//       create: (_) => _splashBloc,
//       child: Scaffold(
//         body: Container(
//           width: double.maxFinite,
//           decoration: BoxDecoration(gradient: AppColors.splashScreenGradient),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 55,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     BlocBuilder<SplashBloc, SplashState>(
//                       builder: (context, state) {
//                         double position = 0;
//                         bool textVisible = false;
//
//                         if (state is SplashAnimating) {
//                           position = state.position;
//                           textVisible = state.textVisible;
//                         }
//
//                         return Stack(
//                           children: [
//                             Positioned(
//                               left: position,
//                               child: Image.asset(
//                                 "${ImageConstant.iconPath}/globe icon.png",
//                                 width: 36,
//                                 height: 36,
//                                 color: AppColors.whiteColor,
//                               ),
//                             ),
//                             Positioned(
//                               left: screenWidth / 2.7,
//                               child: AnimatedOpacity(
//                                 duration: const Duration(milliseconds: 1500),
//                                 opacity: textVisible ? 1 : 0,
//                                 child: Text(
//                                   "Travel",
//                                   style: CustomTextStyle.lobsterRegular(
//                                     fontSize: 44,
//                                     color: AppColors.whiteColor,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 32),
//               Text(
//                 "Find Your Dream\nDestination With Us",
//                 textAlign: TextAlign.center,
//                 style: CustomTextStyle.robotoRegular(
//                   fontSize: 20,
//                   color: AppColors.whiteColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
