enum OptionIntRange {
  age(low: 0, high: 18, steps: 18),
  maxPlaytime(low: 0, high: 240, steps: 24),
  maxPlayers(low: 0, high: 20, steps: 20),
  bestPlayers(low: 0, high: 20, steps: 20),
  bestOrGoodPlayerCount(low: 0, high: 20, steps: 20),
  fallback(low: 0, high: 20, steps: 20)
  ;

  const OptionIntRange({
    required this.low,
    required this.high,
    required this.steps,
  });


  final int low;
  final int high;
  final int steps;
}