import 'package:medguard/app/helper/all_imports.dart';

class AppText extends StatefulWidget {
  AppText({
    required this.text,
    this.width,
    this.height,
    this.style,
    this.strutStyle,
    this.minFontSize = 1,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.group,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.wrapWords = true,
    this.overflow,
    this.overflowReplacement,
    this.textScaleFactor,
    this.maxLines = 1,
    this.semanticsLabel,
    this.centered = false,
  });
  double? height;
  double? width;
  String text;
  bool centered = false;
  Key? textKey;
  TextStyle? style;
  StrutStyle? strutStyle;
  double minFontSize = 1;
  double? maxFontSize = double.infinity;
  double? stepGranularity = 1;
  List<double>? presetFontSizes;
  AutoSizeGroup? group;
  TextAlign? textAlign;
  TextDirection? textDirection;
  Locale? locale;
  bool? softWrap;
  bool wrapWords = true;
  TextOverflow? overflow;
  Widget? overflowReplacement;
  double? textScaleFactor;
  int? maxLines = 1;
  String? semanticsLabel;
  @override
  State<AppText> createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: widget.centered
          ? Center(
              child: GestureDetector(
                onLongPress: () async {
                  await textToSpeech(widget.text);
                },
                child: AutoSizeText(
                  widget.text,
                  style: widget.style,
                  strutStyle: widget.strutStyle,
                  minFontSize: widget.minFontSize,
                  maxFontSize: widget.maxFontSize = double.infinity,
                  stepGranularity: widget.stepGranularity = 1,
                  presetFontSizes: widget.presetFontSizes,
                  group: widget.group,
                  textAlign: widget.textAlign,
                  textDirection: widget.textDirection,
                  locale: widget.locale,
                  softWrap: widget.softWrap,
                  wrapWords: widget.wrapWords,
                  overflow: widget.overflow,
                  overflowReplacement: widget.overflowReplacement,
                  textScaleFactor: widget.textScaleFactor,
                  maxLines: widget.maxLines,
                  semanticsLabel: widget.semanticsLabel,
                ),
              ),
            )
          : GestureDetector(
              onLongPress: () async {
                await textToSpeech(widget.text);
              },
              child: AutoSizeText(
                widget.text,
                style: widget.style,
                strutStyle: widget.strutStyle,
                minFontSize: widget.minFontSize,
                maxFontSize: widget.maxFontSize = double.infinity,
                stepGranularity: widget.stepGranularity = 1,
                presetFontSizes: widget.presetFontSizes,
                group: widget.group,
                textAlign: widget.textAlign,
                textDirection: widget.textDirection,
                locale: widget.locale,
                softWrap: widget.softWrap,
                wrapWords: widget.wrapWords,
                overflow: widget.overflow,
                overflowReplacement: widget.overflowReplacement,
                textScaleFactor: widget.textScaleFactor,
                maxLines: widget.maxLines,
                semanticsLabel: widget.semanticsLabel,
              ),
            ),
    );
  }
}

class AppRichText extends StatefulWidget {
  AppRichText({
    required this.text,
    this.width,
    this.height,
    this.style,
    this.strutStyle,
    this.minFontSize = 1,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.group,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.wrapWords = true,
    this.overflow,
    this.overflowReplacement,
    this.textScaleFactor,
    this.maxLines = 1,
    this.semanticsLabel,
    this.centered = false,
  });
  double? height;
  double? width;
  TextSpan text;
  bool centered = false;
  Key? textKey;
  TextStyle? style;
  StrutStyle? strutStyle;
  double minFontSize = 1;
  double? maxFontSize = double.infinity;
  double? stepGranularity = 1;
  List<double>? presetFontSizes;
  AutoSizeGroup? group;
  TextAlign? textAlign;
  TextDirection? textDirection;
  Locale? locale;
  bool? softWrap;
  bool wrapWords = true;
  TextOverflow? overflow;
  Widget? overflowReplacement;
  double? textScaleFactor;
  int? maxLines = 1;
  String? semanticsLabel;
  @override
  State<AppRichText> createState() => _AppRichTextState();
}

class _AppRichTextState extends State<AppRichText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: widget.centered
          ? Center(
              child: AutoSizeText.rich(
                widget.text,
                style: widget.style,
                strutStyle: widget.strutStyle,
                minFontSize: widget.minFontSize,
                maxFontSize: widget.maxFontSize = double.infinity,
                stepGranularity: widget.stepGranularity = 1,
                presetFontSizes: widget.presetFontSizes,
                group: widget.group,
                textAlign: widget.textAlign,
                textDirection: widget.textDirection,
                locale: widget.locale,
                softWrap: widget.softWrap,
                wrapWords: widget.wrapWords,
                overflow: widget.overflow,
                overflowReplacement: widget.overflowReplacement,
                textScaleFactor: widget.textScaleFactor,
                maxLines: widget.maxLines,
                semanticsLabel: widget.semanticsLabel,
              ),
            )
          : AutoSizeText.rich(
              widget.text,
              style: widget.style,
              strutStyle: widget.strutStyle,
              minFontSize: widget.minFontSize,
              maxFontSize: widget.maxFontSize = double.infinity,
              stepGranularity: widget.stepGranularity = 1,
              presetFontSizes: widget.presetFontSizes,
              group: widget.group,
              textAlign: widget.textAlign,
              textDirection: widget.textDirection,
              locale: widget.locale,
              softWrap: widget.softWrap,
              wrapWords: widget.wrapWords,
              overflow: widget.overflow,
              overflowReplacement: widget.overflowReplacement,
              textScaleFactor: widget.textScaleFactor,
              maxLines: widget.maxLines,
              semanticsLabel: widget.semanticsLabel,
            ),
    );
  }
}
