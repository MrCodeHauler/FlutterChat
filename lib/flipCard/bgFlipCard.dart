import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_world/flipCard/bgAnimationCard.dart';
import 'package:hello_world/flipCard/bgFlipCardController.dart';

typedef void BoolCallBack(bool isFront);

enum FlipDirection {
  Vertical, // 纵向
  Horizontal // 横向
}

class BGFlipCard extends StatefulWidget {

  final Widget front;
  final Widget back;

  final int speed;
  final FlipDirection direction;
  final VoidCallback? onFlip;
  final BoolCallBack? onFlipDone;
  final BGFlipCardController? controller;

  final bool flipOnTouch;
  final Alignment alignment;

  const BGFlipCard({
    Key? key,
    required this.front,
    required this.back,
    this.speed = 500,
    this.onFlip,
    this.onFlipDone,
    this.direction = FlipDirection.Horizontal,
    this.flipOnTouch = true,
    this.alignment = Alignment.center,
    this.controller,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BGFlipCardState();
  }
}

class BGFlipCardState extends State<BGFlipCard> with SingleTickerProviderStateMixin {

  AnimationController? controller;
  Animation<double>? _frontRotation;
  Animation<double>? _backRotation;

  bool isFront = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: widget.speed),
        vsync: this);
    _frontRotation = TweenSequence(
      [
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: pi / 2).chain(CurveTween(curve: Curves.easeIn)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(controller!);
    _backRotation = TweenSequence(
      [
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: -pi / 2, end: 0.0).chain(CurveTween(curve: Curves.easeOut)),
          weight: 50.0,
        ),
      ],
    ).animate(controller!);
    controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (widget.onFlipDone != null) widget.onFlipDone!(isFront);
      }
    });

    widget.controller?.state = this;
  }

  @override
  Widget build(BuildContext context) {
    final child = Stack(
      alignment: widget.alignment,
      fit: StackFit.passthrough,
      children: <Widget>[
        _buildContent(front: true),
        _buildContent(front: false),
      ],
    );

    if (widget.flipOnTouch) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: toggleCard,
        child: child,
      );
    }

    return child;
  }

  Widget _buildContent({required bool front}) {
    return IgnorePointer(
      ignoring: front ? !isFront : isFront,
      child: BGAnimationCard(
        animation: front ? _frontRotation : _backRotation,
        child: front ? widget.front : widget.back,
        direction: widget.direction,
      ),
    );
  }

  void toggleCard() {
    if (widget.onFlip != null) {
      widget.onFlip!();
    }

    controller!.duration = Duration(milliseconds: widget.speed);
    if (isFront) {
      controller!.forward();
    } else {
      controller!.reverse();
    }

    setState(() {
      isFront = !isFront;
    });
  }
}

