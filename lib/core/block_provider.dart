import '../features/home_screen/widgets/provider/populer_place_bloc.dart';
import '../features/splash_screen/controller/splash_block.dart';
import 'exports.dart';

List<BlocProvider> blocProviders = [
  BlocProvider(create: (context) => SplashBloc()),
  BlocProvider(create: (context) => PopularPlaceBloc()),
];
