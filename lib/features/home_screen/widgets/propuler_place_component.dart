import 'package:sentiangreeks_task/features/home_screen/widgets/provider/populer_place_bloc.dart';
import 'package:sentiangreeks_task/features/home_screen/widgets/provider/populer_place_event.dart';
import 'package:sentiangreeks_task/features/home_screen/widgets/provider/populer_place_state.dart';

import '../../../core/exports.dart';

class PopularPlaceComponent extends StatelessWidget {
  const PopularPlaceComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List popularPlaceList = [
      "Most Viewed",
      "Nearby",
      "Latest",
      "Most Viewed",
      "Nearby",
      "Latest",
    ];
    return BlocBuilder<PopularPlaceBloc, PopularPlaceState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              popularPlaceList.length,
              (index) => GestureDetector(
                // borderRadius: BorderRadius.circular(20),
                onTap: () {
                  context.read<PopularPlaceBloc>().add(SelectPlaceEvent(index));
                },
                child: Container(
                  margin: EdgeInsets.only(left: index == 0 ? 0 : 17),
                  padding: EdgeInsets.all(20).copyWith(bottom: 17, top: 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        state.selectedIndex == index
                            ? AppColors.primaryColor
                            : AppColors.textFieldBorderGrayColor.withAlpha(30),
                  ),
                  child: Text(
                    popularPlaceList[index],
                    style: CustomTextStyle.robotoRegular(
                      color:
                          state.selectedIndex == index
                              ? AppColors.whiteColor
                              : AppColors.textColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
