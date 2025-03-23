import 'package:sentiangreeks_task/core/exports.dart';

class CustomDialog extends StatelessWidget {
  final String title;

  const CustomDialog({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Column(
        children: [
          Text(
            "You Selected",
            style: CustomTextStyle.montserratBold(fontSize: 17),
          ),
          gapH24,
          Text(
            title,
            textAlign: TextAlign.center,
            style: CustomTextStyle.poppinsRegular(),
          ),
          gapH24,
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            height: 40,
            onPressed: () => Navigator.pop(context),
            color: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Close",
              style: CustomTextStyle.poppinsRegular(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
