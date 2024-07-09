import 'package:medguard/app/helper/all_imports.dart';

class CommonButton extends StatefulWidget {
  CommonButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.height,
      this.width});
  String text;
  VoidCallback onTap;
  double? height;
  double? width;
  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 48.h(context),
        width: 311.w(context),
        decoration: BoxDecoration(
          color: AppColors.midnightBlue,
          borderRadius: BorderRadius.circular(61),
        ),
        child: Center(
          child: AppText(
            text: widget.text,
            height: 24.h(context),
            centered: true,
            style: TextStyle(
              color: AppColors.white,
              fontFamily: inter,
              fontWeight: FontWeight.w500,
              fontSize: 16.t(context),
            ),
          ),
        ),
      ),
    );
  }
}
