/// Timer formatter
extension TimeFormatter on int {
  String formatTimer() {
    final minutes = this ~/ 60;
    final seconds = (this % 60).toString().padLeft(2, '0');

    // If minutes are zero, return only the seconds
    if (minutes == 0) {
      return '$seconds seconds';
    }

    // Otherwise, return minutes and seconds
    return '$minutes min $seconds sec';
  }
}
