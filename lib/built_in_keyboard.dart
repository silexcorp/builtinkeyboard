library built_in_keyboard;

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'language.dart';

class BuiltInKeyboard extends StatefulWidget {

  //Change keyboard distribution
  final VoidCallback onChangeKeyboard;

  //Enter pressed
  final VoidCallback onEnter;

  // Language of the keyboard
  final Language language;

  // layout of the keyboard
  final Layout layout;

  // The controller connected to the InputField
  final TextEditingController? controller;

  // Vertical spacing between key rows
  final double spacing;

  // Border radius of the keys
  final BorderRadius? borderRadius;

  // Color of the keys
  final Color color;

  // TextStyle of the letters in the keys (fontsize, fontface)
  final TextStyle letterStyle;
  final TextStyle letterStyleLanguage;

  // the additional key that can be added to the keyboard
  final bool enableSpaceBar;
  final bool enableBackSpace;
  final bool enableCapsLock;

  // height and width of each key
  final double? height;
  final double? width;

  // Additional functionality for the keys //

  // Makes the keyboard uppercase
  final bool enableAllUppercase;

  // Long press to write uppercase letters
  final bool enableLongPressUppercase;

  // The color displayed when the key is pressed
  final Color? highlightColor;
  final Color? splashColor;

  const BuiltInKeyboard({
    @required this.controller,
    this.language = Language.EN,
    this.layout = Layout.QWERTY,
    this.height,
    this.width,
    this.spacing = 8.0,
    this.borderRadius,
    this.color = Colors.black54,
    this.letterStyle = const TextStyle(fontSize: 25, color: Colors.black),
    this.letterStyleLanguage = const TextStyle(fontSize: 25, color: Colors.black54),
    this.enableSpaceBar = false,
    this.enableBackSpace = true,
    this.enableCapsLock = false,
    this.enableAllUppercase = false,
    this.enableLongPressUppercase = false,
    this.highlightColor,
    this.splashColor,
    required this.onChangeKeyboard,
    required this.onEnter,
  });
  @override
  BuiltInKeyboardState createState() => BuiltInKeyboardState();
}

class BuiltInKeyboardState extends State<BuiltInKeyboard> {
  double? height;
  double? width;
  bool capsLockUppercase = false;
  bool changeOtherLanguage = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    height = screenHeight > 800 ? screenHeight * 0.062 : screenHeight * 0.074;
    width = screenWidth > 350 ? screenWidth * 0.084 : screenWidth * 0.082;
    List<Widget> keyboardLayout = layout(capsLockUppercase, changeOtherLanguage);
    double hspacing;
    int topLen, midLen;
    try {
      hspacing = double.parse(languageConfig[widget.language]![widget.layout]![
          'horizontalSpacing']!);
      topLen = int.parse(
          languageConfig[widget.language]![widget.layout]!['topLength']!);
      midLen = int.parse(
          languageConfig[widget.language]![widget.layout]!['middleLength']!);
    } catch (_CastError) {
      printError(
          "Uknown language or layout was used, or Incorrect combination of language-layout");
      exit(0);
    }
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: hspacing,
          runSpacing: 5,
          children: keyboardLayout.sublist(0, topLen),
        ),
        SizedBox(
          height: widget.spacing,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: hspacing,
          runSpacing: 5,
          children: keyboardLayout.sublist(topLen, topLen + midLen),
        ),
        SizedBox(
          height: widget.spacing,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.enableCapsLock
                ? capsLock()
                : SizedBox(
                    width: (widget.width ?? width)! + 20,
                  ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: hspacing,
              runSpacing: 5,
              children: keyboardLayout.sublist(topLen + midLen),
            ),
            widget.enableBackSpace
                ? backSpace()
                : SizedBox(
                    width: (widget.width ?? width)! + 20,
                  ),
          ],
        ),
        SizedBox(
          height: widget.spacing + 2,
        ),
        widget.enableSpaceBar
            ? Row(
                children: [
                  SizedBox(
                    height: widget.spacing,
                    width: 6,
                  ),
                  otherLetter(),
                  SizedBox(
                    width: widget.spacing,
                  ),
                  otherKeyboard(),
                  SizedBox(
                    width: widget.spacing,
                  ),
                  Expanded(child: spaceBar()),
                  SizedBox(
                    width: widget.spacing,
                  ),
                  enterButton(),
                  SizedBox(
                    height: widget.spacing,
                    width: 6,
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }

  // Letter button widget
  Widget buttonLetter(String letter) {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: widget.width ?? width,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onTap: () {
              HapticFeedback.heavyImpact();
              widget.controller?.text += letter;
              widget.controller?.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller!.text.length));
            },
            onLongPress: () {
              if (widget.enableLongPressUppercase || !widget.enableAllUppercase) {
                if(Language.KAQ == widget.language){
                  if(letter == "a"){
                    widget.controller?.text += "ä";
                  }else if(letter == "e"){
                    widget.controller?.text += "ë";
                  }else if(letter == "i"){
                    widget.controller?.text += "ï";
                  }else if(letter == "o"){
                    widget.controller?.text += "ö";
                  }else if(letter == "u"){
                    widget.controller?.text += "ü";
                  }else if(letter == "A"){
                    widget.controller?.text += "Ä";
                  }else if(letter == "E"){
                    widget.controller?.text += "Ë";
                  }else if(letter == "I"){
                    widget.controller?.text += "Ï";
                  }else if(letter == "O"){
                    widget.controller?.text += "Ö";
                  }else if(letter == "U"){
                    widget.controller?.text += "Ü";
                  }else if(letter == "Ä"){
                    widget.controller?.text += "A";
                  }else if(letter == "Ë"){
                    widget.controller?.text += "E";
                  }else if(letter == "Ï"){
                    widget.controller?.text += "I";
                  }else if(letter == "Ö"){
                    widget.controller?.text += "O";
                  }else if(letter == "Ü"){
                    widget.controller?.text += "U";
                  }else{
                    widget.controller?.text += letter.toUpperCase();
                  }
                }if(Language.QEQ == widget.language){
                  if(letter == "a"){
                    widget.controller?.text += "aa";
                  }else if(letter == "e"){
                    widget.controller?.text += "ee";
                  }else if(letter == "i"){
                    widget.controller?.text += "ii";
                  }else if(letter == "o"){
                    widget.controller?.text += "oo";
                  }else if(letter == "u"){
                    widget.controller?.text += "uu";
                  }else if(letter == "A"){
                    widget.controller?.text += "AA";
                  }else if(letter == "E"){
                    widget.controller?.text += "EE";
                  }else if(letter == "I"){
                    widget.controller?.text += "II";
                  }else if(letter == "O"){
                    widget.controller?.text += "OO";
                  }else if(letter == "U"){
                    widget.controller?.text += "UU";
                  }else if(letter == "AA"){
                    widget.controller?.text += "a";
                  }else if(letter == "EE"){
                    widget.controller?.text += "e";
                  }else if(letter == "II"){
                    widget.controller?.text += "i";
                  }else if(letter == "OO"){
                    widget.controller?.text += "o";
                  }else if(letter == "UU"){
                    widget.controller?.text += "u";
                  }else{
                    widget.controller?.text += letter.toUpperCase();
                  }
                }else{
                  widget.controller?.text += letter.toUpperCase();
                }

                widget.controller?.selection = TextSelection.fromPosition(TextPosition(offset: widget.controller!.text.length));
              }
            },
            child: Center(
              child: AutoSizeText(
                letter,
                style: widget.letterStyle,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Spacebar button widget
  Widget spaceBar() {
    String keyboradName = "Español";
    if(widget.language == Language.KAQ) keyboradName = "Kaqchikel";
    if(widget.language == Language.QAN) keyboradName = "Q'anjob'al";
    if(widget.language == Language.KCH) keyboradName = "K'iche'";
    if(widget.language == Language.QEQ) keyboradName = "Q'eqchi'";
    if(widget.language == Language.MAM) keyboradName = "Mam";
    if(widget.language == Language.POP) keyboradName = "Popti'";
    if(widget.language == Language.POQ) keyboradName = "Poqomam";
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: (widget.width ?? width)! + 190,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onTap: () {
              HapticFeedback.heavyImpact();
              widget.controller?.text += ' ';
              widget.controller?.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller!.text.length));
            },
            child: Center(
              child: AutoSizeText(
                keyboradName,
                style: widget.letterStyleLanguage,
                maxLines: 1,
              )
            ),
          ),
        ),
      ),
    );
  }

  // Backspace button widget
  Widget backSpace() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: (widget.width ?? width)! + 20,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onTap: () {
              HapticFeedback.heavyImpact();
              if (widget.controller!.text.isNotEmpty) {
                widget.controller?.text = widget.controller!.text
                    .substring(0, widget.controller!.text.length - 1);
                widget.controller?.selection = TextSelection.fromPosition(
                    TextPosition(offset: widget.controller!.text.length));
              }
            },
            onLongPress: () {
              if (widget.controller!.text.isNotEmpty) {
                widget.controller?.text = '';
                widget.controller?.selection = TextSelection.fromPosition(
                    TextPosition(offset: widget.controller!.text.length));
              }
            },
            child: Center(
              child: Icon(
                Icons.backspace,
                size: widget.letterStyle.fontSize,
                color: widget.letterStyle.color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Other letters
  Widget enterButton() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: (widget.width ?? width)! + 20,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onTap: widget.onEnter,
            child: Center(
              child: Icon(
                Icons.check_circle_sharp,
                size: widget.letterStyle.fontSize,
                color: widget.letterStyle.color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget otherLetter() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: (widget.width ?? width)! + 20,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onTap: () {

              HapticFeedback.heavyImpact();
              setState(() {
                changeOtherLanguage = !changeOtherLanguage;
              });
            },
            child: Center(
              child: Icon(
                Icons.onetwothree_rounded,
                size: widget.letterStyle.fontSize! + 16,
                color: widget.letterStyle.color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget otherKeyboard() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: (widget.width ?? width)! + 10,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onLongPress: widget.onChangeKeyboard,
            child: Center(
              child: Icon(
                Icons.language,
                size: widget.letterStyle.fontSize,
                color: widget.letterStyle.color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Capslock button widget
  Widget capsLock() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: (widget.width ?? width)! + 20,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onTap: () {
              HapticFeedback.heavyImpact();
              setState(() {
                capsLockUppercase = !capsLockUppercase;
              });
            },
            child: Center(
              child: Icon(
                Icons.upload_rounded,
                size: widget.letterStyle.fontSize,
                color: widget.letterStyle.color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Keyboard layout list
  List<Widget> layout(bool isUpper, bool isStrange) {
    List<String> letters = [];
    try {
      letters = languageConfig[widget.language]![widget.layout]!['layout']!.split(" ");
    } catch (_CastError) {
      printError(
          "Uknown language or layout was used, or Incorrect combination of language-layout");
      exit(0);
    }

    List<Widget> keyboard = [];
    letters.forEach((String letter) {
      if(isStrange){
        if(Language.KAQ == widget.language){
          if(letter == "a"){
            letter = "ä";
          }else if(letter == "e"){
            letter = "ë";
          }else if(letter == "i"){
            letter = "ï";
          }else if(letter == "o"){
            letter = "ö";
          }else if(letter == "u"){
            letter = "ü";
          }
          keyboard.add(
            buttonLetter(isUpper ? letter.toUpperCase() : letter),
          );
        }if(Language.QEQ == widget.language){
          if(letter == "a"){
            letter = "aa";
          }else if(letter == "e"){
            letter = "ee";
          }else if(letter == "i"){
            letter = "ii";
          }else if(letter == "o"){
            letter = "oo";
          }else if(letter == "u"){
            letter = "uu";
          }
          keyboard.add(
            buttonLetter(isUpper ? letter.toUpperCase() : letter),
          );
        }else{
          keyboard.add(
            buttonLetter(isUpper ? letter.toUpperCase() : letter),
          );
        }
      }else{
        keyboard.add(
          buttonLetter(isUpper ? letter.toUpperCase() : letter),
        );
      }
    });
    return keyboard;
  }
}

void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}
