class GameModel {
  GameModel(this.target,
      [this.current = sliderStart,
      this.totalScore = scoreStart,
      this.round = roundStart]);

  static const sliderStart = 50;
  static const scoreStart = 0;
  static const roundStart = 0;

  int target;
  int current;
  int totalScore;
  int round;

  int get extraPoints {
    var difference = (target - current).abs();
    return difference == 0
        ? 100
        : difference == 1
            ? 50
            : 0;
  }
}
