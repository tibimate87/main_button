library main_button_widget;

import 'package:flutter/material.dart';
import 'package:screensizes/screensizes.dart';

class MainButton extends StatefulWidget {
  final String text;
  final Color color;
  final Function onTap;
  final bool isVisible;
  final bool isSignOut;
  final bool isPP;
  final String image;
  const MainButton(
      {@required this.text,
      @required this.onTap,
      @required this.isVisible,
      this.isSignOut = false,
      this.color,
      this.isPP = false,
      this.image});

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
                  ? Theme.of(context).buttonColor.withOpacity(opacity)
                  : widget.color,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: ScreenSizes.screenWidth(context),
          height: ScreenSizes.screenHeight(context) / 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.image != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage(widget.image),
                        color: widget.color == null
                            ? Colors.white.withOpacity(opacity)
                            : Theme.of(context)
                                .buttonColor
                                .withOpacity(opacity),
                      ),
                    )
                  : Container(),
              Text(
                widget.text,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: widget.isSignOut
                          ? Colors.red
                          : widget.color == null
                              ? Colors.white.withOpacity(opacity)
                              : Theme.of(context)
                                  .buttonColor
                                  .withOpacity(opacity),
                      fontSize: ScreenSizes.screenWidth(context) /
                          (widget.isPP ? 35 : 25),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
