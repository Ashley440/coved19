class Province {
  final String name;
  final int stats;

  Province({this.name, this.stats});

  @override
  String toString() {
    return "$name $stats";
  }
}
