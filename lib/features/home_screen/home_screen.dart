import 'package:flutter/cupertino.dart';
import 'package:sentiangreeks_task/features/home_screen/widgets/popular_image_component.dart';
import 'package:sentiangreeks_task/features/home_screen/widgets/propuler_place_component.dart';
import 'package:sentiangreeks_task/features/home_screen/widgets/provider/populer_place_bloc.dart';

import '../../core/exports.dart';
import '../search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PopularPlaceBloc _popularPlaceBloc;

  @override
  void initState() {
    super.initState();
    _popularPlaceBloc = PopularPlaceBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Hi, David 👋",
                  style: CustomTextStyle.montserratBold(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                gapH4,
                Text(
                  "Explore the world",
                  style: CustomTextStyle.interRegular(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGrayTextColor,
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                "https://s3-alpha-sig.figma.com/img/38bd/1c9e/09eaeb6b34a4a9fd021736fc5695d8cb?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=c~gDN5uK-fMQqK0P5ApHERzPTdXBIWQtD8JQgzdLjfJGF7TZlI2LpSJxyhxbXO~Tq6UNz-907dLsz5Tp8yA7Xg8Yv3BVC4d1CcJqjJvE~-NAvP1j1k97j7gWQfspfMDWhPy3mjXRo9RGHj9pkiyIDn7hyHZUrlQF0lKMHN4ycLFAFnoG73IKsFF5KQTj6pACXJMsKh52hAD9ZKzNYAegGdCdDl2Sp6Cf9gaSbVOVUeIUR34Kxw3LPnVAbvlseylpR8es4NSg28f6IRMg0QnbIGwmbccPzfinG-ogW9AykfHQC8Fv9VvFeimOZ964Gej90GdWk8j9lGaemg~muZMmhA__",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          gapH8,
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return SearchScreen();
                  },
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.textFieldBorderGrayColor),
              ),
              child: Row(
                children: [
                  Text(
                    "Search places",
                    style: CustomTextStyle.robotoRegular(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 1,
                    height: 32,
                    color: AppColors.extraLightGrayTextColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      25.0,
                    ).copyWith(right: 15, bottom: 0, top: 0),
                    child: Image.asset(
                      "${ImageConstant.iconPath}/icon setting.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          gapH32,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular places",
                style: CustomTextStyle.poppinsRegular(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "View all",
                style: CustomTextStyle.robotoRegular(
                  fontSize: 16,
                  color: AppColors.lightGrayTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          gapH32,
          BlocProvider(
            create: (context) => _popularPlaceBloc,
            child: PopularPlaceComponent(),
          ),
          gapH32,
          PopularImageComponent(),
          gapH32,
        ],
      ),
    );
  }
}
