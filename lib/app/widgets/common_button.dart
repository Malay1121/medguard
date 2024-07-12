import 'package:medguard/app/helper/all_imports.dart';

class CommonButton extends StatefulWidget {
  CommonButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.height = 48,
      this.width = 342,
      this.backgroundColor,
      this.textColor});
  String text;
  VoidCallback onTap;
  double height;
  double width;
  Color? backgroundColor;
  Color? textColor;
  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height.h(context),
        width: widget.width.w(context),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.midnightBlue,
          borderRadius: BorderRadius.circular(61),
        ),
        child: Center(
          child: AppText(
            text: widget.text,
            height: 24.h(context),
            centered: true,
            style: TextStyle(
              color: widget.textColor ?? AppColors.white,
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
