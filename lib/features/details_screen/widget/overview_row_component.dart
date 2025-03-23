import '../../../core/exports.dart';

class OverviewRowComponent extends StatelessWidget {
  final String imagePath, title;
  const OverviewRowComponent({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.lightGrayTextColor.withAlpha(34),
          ),
          child: Image.asset(imagePath, width: 16, height: 16),
        ),
        gapW8,
        Text(title, style: CustomTextStyle.robotoRegular(fontSize: 18)),
      ],
    );
  }
}
