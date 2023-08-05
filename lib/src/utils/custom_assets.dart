class CustomAssets {
  static String getAssetPath(String asset) => "assets/images/$asset";
  static String getAssetPathSvg(String asset) => "assets/icons/$asset.svg";
  static String getAssetPathIconPng(String asset) => "assets/icons/$asset.png";

  static String textLogo = getAssetPath("text_logo.png");
  static String splashLogo = getAssetPath("gaam_splash.png");
  static String welcomePage0 = getAssetPath("welcome0.png");
  static String welcomePage1 = getAssetPath("welcome1.png");

  static String cat3 = getAssetPath("cat3.jpeg");
  static String package = getAssetPath("package.png");
  static String moveMate = getAssetPath("move_mate.png");
  static String deliveryBox = getAssetPath("delivery_box.png");

  static String bus = getAssetPath("bus.svg");
  static String airplane = getAssetPath("airplane.svg");
  static String ship = getAssetPath("ship.svg");
  static String forklift = getAssetPath("forklift.png");
  static String move = getAssetPath("move.png");
}
