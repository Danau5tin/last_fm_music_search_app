class Track {
  final String name;
  final String artistName;
  final Duration duration;

  Track(this.name, this.artistName, this.duration);

  String get readableDuration {
    final durationInMins = duration.inMinutes;
    final durationInSecs = duration.inSeconds;
    String remainingSecs = (durationInSecs - 60*durationInMins).toString();
    if(remainingSecs.length == 1) {
      remainingSecs = "0$remainingSecs";
    }
    return "$durationInMins:$remainingSecs";
  }

}