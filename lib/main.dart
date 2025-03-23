import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sentiangreeks_task/core/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('likedPosts');
  // await Hive.openBox<Map>('likedPosts');
  runApp(MultiBlocProvider(providers: blocProviders, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sentient Greeks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      home: SplashScreen(),
    );
  }
}
