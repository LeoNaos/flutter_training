import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_app_ex3/common/app_style.dart';

enum ClickMode {
  FilterAll,
  FilterInProgress,
  FilterComplete,
  Add,
}

class AnimatedFab extends StatefulWidget {
  final Function(ClickMode mode) onClick;

  const AnimatedFab({Key key, this.onClick}) : super(key: key);

  @override
  _AnimatedFabState createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  //
  AnimationController _animationController;
  Animation<Color> _colorAnimation;

  //
  final double expandedSize = 180.0;
  final double hiddenSize = 20.0;
  final mainColor = Color(int.parse('0xff6074F9'));

  @override
  void initState() {
    super.initState();

    //
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _colorAnimation = ColorTween(begin: mainColor, end: mainColor)
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expandedSize,
      height: expandedSize,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildExpandedBackground(),
              _buildOption(AppIcons.FILTER_ALL, 0.0, ClickMode.FilterAll),
              _buildOption(AppIcons.FILTER_PROGRESS, -math.pi / 3,
                  ClickMode.FilterInProgress),
              _buildOption(AppIcons.FILTER_COMPLETE, -2 * math.pi / 3,
                  ClickMode.FilterComplete),
              _buildOption(AppIcons.FILTER_ADD, math.pi, ClickMode.Add),
              _buildFabCore(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOption(IconData icon, double angle, ClickMode mode) {
    if (_animationController.isDismissed) {
      return Container();
    }
    double iconSize = 0.0;
    if (_animationController.value > 0.8) {
      iconSize = 26.0 * (_animationController.value - 0.8) * 5;
    }
    return Transform.rotate(
      angle: angle,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: IconButton(
            onPressed: () => _onIconClick(mode),
            icon: Transform.rotate(
              angle: -angle,
              child: Icon(
                icon,
                color: AppColors.white,
              ),
            ),
            iconSize: iconSize,
            alignment: Alignment.center,
            padding: EdgeInsets.all(0.0),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedBackground() {
    double size =
        hiddenSize + (expandedSize - hiddenSize) * _animationController.value;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: mainColor),
    );
  }

  Widget _buildFabCore() {
    double scaleFactor = 2 * (_animationController.value - 0.5).abs();
    return FloatingActionButton(
      onPressed: _onFabTap,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(1.0, scaleFactor),
        child: Icon(
          _animationController.value > 0.5 ? Icons.close : Icons.filter_list,
          color: AppColors.white,
          size: 26.0,
        ),
      ),
      backgroundColor: _colorAnimation.value,
    );
  }

  open() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    }
  }

  close() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    }
  }

  _onFabTap() {
    if (_animationController.isDismissed) {
      open();
    } else {
      close();
    }
  }

  _onIconClick(ClickMode mode) {
    widget.onClick(mode);
    close();
  }
}
