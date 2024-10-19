enum FacePosition { UP, DOWN, LEFT, RIGHT }

class FaceMovementController {
  double userFaceRightValue = 0;
  double userFaceLeftValue = 0;

  double userFaceUpValue = 0;
  double userFaceDownValue = 0;

  getFaceYValue(double value) {
    if (value > 10) {
      userFaceLeftValue = value;
    } else if (value < 0 && value <= -10) {
      userFaceRightValue = value;
    } else {
      userFaceLeftValue = 0;
      userFaceRightValue = 0;
    }
  }

  getFaceXValue(double value) {
    if (value > 7) {
      userFaceUpValue = value;
    } else if (value < 0) {
      userFaceDownValue = value;
    } else {
      userFaceDownValue = 0;
      userFaceUpValue = 0;
    }
  }
}
