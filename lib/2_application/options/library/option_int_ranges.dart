enum OptionIntRanges {
  age(low: 0, high: 18, steps: 15),
  maxPlaytime(low: 0, high: 240, steps: 23),
  maxPlayers(low: 0, high: 20, steps: 19),
  bestPlayers(low: 0, high: 20, steps: 19),
  bestOrGoodPlayerCount(low: 0, high: 20, steps: 19),
  ;

  const OptionIntRanges({
    required this.low,
    required this.high,
    required this.steps,
  });


  final double low;
  final double high;
  final int steps;
}