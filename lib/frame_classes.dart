class Frame {
  Frame({
    this.projectName = "",
    this.imageWidth = 0.0,
    this.imageHeight = 0.0,
    this.frameWidth = 0.0,
    this.frameThickness = 0.75,
    this.frameOverlap = 0.25,
    this.hasMat = false,
    this.mat,
    this.frameTopLength = 0.00,
    this.frameSidesLength = 0.00,
    this.miterTopLength = 0.00,
    this.miterSidesLength = 0.00,
  });

  String projectName;

  double imageWidth;
  double imageHeight;
  double frameWidth;
  double frameThickness;
  double frameOverlap;
  bool hasMat;
  Mat? mat;

  double frameTopLength;
  double frameSidesLength;
  double miterTopLength;
  double miterSidesLength;

  calculateMat() {
    mat!.matCutWidth = imageWidth - (mat!.matOverlap * 2);
    mat!.matCutHeight = imageHeight - (mat!.matOverlap * 2);
    mat!.matWidth = imageWidth + ((mat!.matSides * 2) - (mat!.matOverlap * 2));
    mat!.matHeight = imageHeight + ((mat!.matTop * 2) - (mat!.matOverlap * 2));
    return {'height': mat!.matHeight, 'width': mat!.matWidth};
  }

  calculateDimensions() {
    var image =
        hasMat ? calculateMat() : {'height': imageHeight, 'width': imageWidth};
    miterTopLength = image["width"] - (frameOverlap * 2);
    miterSidesLength = image["height"] - (frameOverlap * 2);
    frameTopLength = image["width"] + ((frameWidth * 2) - (frameOverlap * 2));
    frameSidesLength =
        image["height"] + ((frameWidth * 2) - (frameOverlap * 2));
  }
}

class Mat {
  Mat(
      {this.matTop = 0,
      this.matSides = 0,
      this.matOverlap = 0.25,
      this.matHeight = 0.0,
      this.matWidth = 0.0,
      this.matCutHeight = 0.0,
      this.matCutWidth = 0.0});

  double matHeight;
  double matWidth;
  double matCutHeight;
  double matCutWidth;
  double matTop;
  double matSides;
  double matOverlap;
}
