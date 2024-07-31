import 'package:flutter/material.dart';

class Bounce extends StatefulWidget {
  /// Set it to `null` to disable `onTap`.
  final VoidCallback? onTap;
  final void Function(TapUpDetails)? onTapUp;
  final void Function(TapDownDetails)? onTapDown;
  final VoidCallback? onTapCancel;

  /// The reverse duration of the scaling animation when `onTapUp`.
  final Duration duration;

  /// The duration of the scaling animation when `onTapDown`.
  final Duration reverseDuration;

  /// The delay time to execute the onTap method.
  final Duration onTapDelay;

  /// The reverse curve of the scaling animation when `onTapUp`.
  final Curve curve;

  /// The curve of the scaling animation when `onTapDown`..
  final Curve? reverseCurve;

  /// The scale factor of the child widget. The valid range of `scaleFactor` is from `0.0` to `1.0`.
  final double scaleFactor;

  /// If child widget has border radius, Then set this same as child's radius to control the hover effect
  final double borderRadius;

  /// Set this to true if need to remove hover effect on the child
  final bool disableHover;

  /// Splash color for hover effect
  final Color? splashColor;

  /// Highlight color color for hover effect
  final Color? highlightColor;

  final Widget child;

  const Bounce({
    Key? key,
    required this.onTap,
    required this.child,
    this.onTapUp,
    this.onTapDown,
    this.onTapCancel,
    this.duration = const Duration(milliseconds: 200),
    this.reverseDuration = const Duration(milliseconds: 200),
    this.onTapDelay = const Duration(milliseconds: 300),
    this.curve = Curves.decelerate,
    this.reverseCurve = Curves.decelerate,
    this.scaleFactor = 0.8,
    this.borderRadius = 0,
    this.disableHover = false,
    this.splashColor,
    this.highlightColor
  })  : assert(
  scaleFactor >= 0.0 && scaleFactor <= 1.0,
  "The valid range of scaleFactor is from 0.0 to 1.0.",
  ),
        super(key: key);

  @override
  BounceState createState() => BounceState();
}

class BounceState extends State<Bounce>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
    reverseDuration: widget.reverseDuration,
    value: 1.0,
    upperBound: 1.0,
    lowerBound: widget.scaleFactor,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
    reverseCurve: widget.reverseCurve,
  );

  bool _isTapped = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  void _onTap() {
    if (widget.onTap != null) {
      Future.delayed(widget.onTapDelay, () {
        // prevent multiple taps
        if (_isTapped) {
          return;
        }
        _isTapped = true;
        widget.onTap!();
        Future.delayed(widget.onTapDelay, () => _isTapped = false);
      });
    }

    _controller.reverse().then((_) {
      _controller.forward();
    });
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onTapUp != null) widget.onTapUp!(details);
    _controller.forward();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onTapDown != null) widget.onTapDown!(details);
    _controller.reverse();
  }

  void _onTapCancel() {
    if (widget.onTapCancel != null) widget.onTapCancel!();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ScaleTransition(
        scale: _animation,
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.borderRadius)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              widget.child,
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTapCancel: widget.onTap != null ? _onTapCancel : null,
                    onTapDown: widget.onTap != null ? _onTapDown : null,
                    onTapUp: widget.onTap != null ? _onTapUp : null,
                    onTap: widget.onTap != null ? _onTap : null,
                    splashColor: widget.disableHover? Colors.transparent : widget.splashColor,
                    highlightColor: widget.disableHover? Colors.transparent : widget.highlightColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}