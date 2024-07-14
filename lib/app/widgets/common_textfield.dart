import 'dart:ffi';

import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../helper/all_imports.dart';

class CommonTextField extends StatefulWidget {
  CommonTextField({
    super.key,
    required this.hintText,
    this.height = 45,
    this.width = 342,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.maxLines = 1,
  });
  String hintText;
  double? width;
  double? height;
  Widget? prefixIcon;
  TextEditingController? controller;
  bool obscureText;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  int? maxLines;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool listening = false;
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;

  void speak() {
    if (!listening) {
      getText();
    }
  }

  void initializeSpeech() async {
    speechEnabled = await speechToText.initialize(
      onError: (errorNotification) {
        setState(() {
          listening = false;
        });
      },
    );
  }

  Future<String> getText() async {
    String result = "";
    setState(() {
      listening = true;
    });

    SpeechRecognitionResult r = await speechToText.listen(
        listenOptions: SpeechListenOptions(listenMode: ListenMode.dictation),
        partialResults: false,
        onResult: (res) {
          setState(() {
            result = res.recognizedWords;
            if (widget.controller != null) widget.controller!.text += result;
            listening = false;
          });
        });

    return result;
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    initializeSpeech();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width != null ? widget.width!.w(context) : null,
      height: widget.height != null ? widget.height!.h(context) : null,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          fillColor: AppColors.grey50,
          filled: true,
          hintText: widget.hintText,
          suffixIcon: GestureDetector(
            onTap: () => speak(),
            child: Icon(
              listening ? Icons.stop : Icons.mic,
              color: AppColors.midnightBlue,
              size: 24.t(context),
            ),
          ),
          hintStyle: bodySRegular(
            context: context,
            color: AppColors.grey400,
          ),
          prefixIcon: widget.prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.grey300,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.grey300,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.grey300,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.grey300,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
