import 'package:face_recognition/controller/face_movement_controller.dart';
import 'package:flutter/material.dart';

class FaceMoveFiller extends StatefulWidget {
  final FacePosition facePosition;
  final double value;

  FaceMoveFiller({required this.value, required this.facePosition});

  @override
  _FaceMoveFillerState createState() => _FaceMoveFillerState();
}

class _FaceMoveFillerState extends State<FaceMoveFiller> {
  double _fillPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    updateFillBar();
  }

  @override
  void didUpdateWidget(FaceMoveFiller oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      updateFillBar();
    }
  }

  updateFillBar() {
    switch (widget.facePosition) {
      case FacePosition.DOWN:
        _updateFillPercentageUserFaceDownMovement();
        break;
      case FacePosition.UP:
        _updateFillPercentageUserFaceUpMovement();
        break;
      case FacePosition.LEFT:
        _updateFillPercentageUserFaceLeftMovement();
        break;
      case FacePosition.RIGHT:
      default:
        _updateFillPercentageUserFaceRightMovement();
        break;
    }
  }

  void _updateFillPercentageUserFaceLeftMovement() {
    setState(() {
      if (widget.value > 10) {
        if (widget.value > 38) {
          _fillPercentage = 1.0;
        } else {
          _fillPercentage = (widget.value - 10) / (38 - 10);
        }
      } else {
        _fillPercentage = 0.0;
      }
      _fillPercentage = _fillPercentage.clamp(0.0, 1.0);
    });
  }

  void _updateFillPercentageUserFaceRightMovement() {
    setState(() {
      if (widget.value < -5) {
        if (widget.value < -25) {
          _fillPercentage = 1.0;
        } else {
          _fillPercentage = (-25 - widget.value) / (-25 + 5);
        }
      } else {
        _fillPercentage = 0.0;
      }
      _fillPercentage = _fillPercentage.clamp(0.0, 1.0);
    });
  }

  void _updateFillPercentageUserFaceUpMovement() {
    setState(() {
      if (widget.value > 7) {
        if (widget.value > 22) {
          _fillPercentage = 1.0;
        } else {
          _fillPercentage = (widget.value - 7) / (22 - 7);
        }
      } else {
        _fillPercentage = 0.0;
      }
      _fillPercentage = _fillPercentage.clamp(0.0, 1.0);
    });
  }

  void _updateFillPercentageUserFaceDownMovement() {
    setState(() {
      if (widget.value < 0) {
        if (widget.value < -10) {
          _fillPercentage = 1.0;
        } else {
          _fillPercentage = (-10 - widget.value) / (-10 + 0);
        }
      } else {
        _fillPercentage = 0.0;
      }
      _fillPercentage = _fillPercentage.clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double barHeight = 20;
    return SizedBox(
      height: barHeight,
      width: 250,
      child: Stack(
        children: [
          Container(
            width: 250,
            height: barHeight,
            color: Colors.white,
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: _fillPercentage,
            child: Container(
              width: 250,
              height: barHeight,
              color: const Color.fromARGB(255, 184, 183, 183),
            ),
          ),
          Center(
            child: Text(
              widget.facePosition.name.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
