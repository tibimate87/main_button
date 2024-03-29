library main_button_widget;

import 'package:flutter/material.dart';
import 'package:screensizes/screensizes.dart';

class MainButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Color imageColor;
  final Function onTap;
  final bool isVisible;
  final bool isSignOut;
  final bool isPP;
  final String image;
  final double additionalHeight;
  final double radius;
  final TextStyle textStyle;
  const MainButton(
      {@required this.text,
      @required this.onTap,
      @required this.isVisible,
      this.textColor,
      this.imageColor,
      this.isSignOut = false,
      this.color,
      this.isPP = false,
      this.image,
      this.additionalHeight = 0,
      this.radius = 10,
      this.textStyle});

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        onTapDown: (value) {
          setState(() {
            opacity = 0.8;
          });
        },
        onTapUp: (value) {
          setState(() {
            opacity = 1;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: widget.color == null
                  ? Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(opacity)
                  : widget.color,
              borderRadius: BorderRadius.all(Radius.circular(widget.radius))),
          width: ScreenSizes.screenWidth(context),
          height: ScreenSizes.textSize(
                  widget.text,
                  Theme.of(context).textTheme.bodyLarge.copyWith(
                        color: widget.isSignOut
                            ? Colors.red
                            : widget.textColor == null
                                ? Colors.white.withOpacity(opacity)
                                : widget.textColor,
                        fontSize: ScreenSizes.screenWidth(context) /
                            (widget.isPP ? 35 : 25),
                      )).height +
              widget.additionalHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.image != null
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(
                          8,
                          widget.additionalHeight / 2,
                          8,
                          widget.additionalHeight / 2),
                      child: Image(
                          image: AssetImage(widget.image),
                          color: widget.imageColor),
                    )
                  : Container(),
              Text(
                widget.text,
                style: widget.textStyle == null
                    ? Theme.of(context).textTheme.bodyLarge.copyWith(
                          color: widget.isSignOut
                              ? Colors.red
                              : widget.textColor == null
                                  ? Colors.white.withOpacity(opacity)
                                  : widget.textColor,
                          fontSize: ScreenSizes.screenWidth(context) /
                              (widget.isPP ? 35 : 25),
                        )
                    : widget.textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
