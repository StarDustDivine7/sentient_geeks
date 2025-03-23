import '../../core/exports.dart';
import '../home_screen/home_screen.dart';
import '../my_favorite/my_favorite.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    Center(child: Text("data")),
    MyFavorite(),
    Center(child: Text("data")),
  ];

  final List _icons = [
    {
      "image1": "${ImageConstant.iconPath}/home_outline.png",
      "image2": "${ImageConstant.iconPath}/icon home.png",
    },
    {
      "image1": "${ImageConstant.iconPath}/clock.png",
      "image2": "${ImageConstant.iconPath}/time.png",
    },
    {
      "image1": "${ImageConstant.iconPath}/heart.png",
      "image2": "${ImageConstant.iconPath}/heart_fill.png",
    },
    {
      "image1": "${ImageConstant.iconPath}/user_outline.png",
      "image2": "${ImageConstant.iconPath}/user.png",
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_icons.length, (index) {
              return InkWell(
                borderRadius: BorderRadius.circular(60),
                onTap: () => _onItemTapped(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        _selectedIndex == index
                            ? _icons[index]['image2']
                            : _icons[index]['image1'],
                        color:
                            _selectedIndex == index
                                ? AppColors.primaryColor
                                : AppColors.lightGrayTextColor,
                        width: 23,
                        height: 22,
                      ),
                      gapH4,
                      _selectedIndex == index
                          ? Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.red,
                            ),
                          )
                          : SizedBox(),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
