import 'package:intl/intl.dart';

enum DateOption {
  today(title: 'Today'),
  nextMonday(title: 'Next Monday'),
  nextTuesday(title: 'Next Tuesday'),
  nextWeek(title: 'Next Week'),
  noDate(
    title: 'No Date',
  );

  final String title;

  const DateOption({
    required this.title,
  });

  DateTime? get value {
    switch (this) {
      case DateOption.today:
        return DateTime.now();
      case DateOption.nextMonday:
        return DateTime.now()
            .add(Duration(days: (8 - DateTime.now().weekday) % 7));
      case DateOption.nextTuesday:
        return DateTime.now()
            .add(Duration(days: (9 - DateTime.now().weekday) % 7));
      case DateOption.nextWeek:
        return DateTime.now().add(const Duration(days: 7));
      case DateOption.noDate:
        return null;
    }
  }

  static String getTitleForDate(DateTime? date) {
    if (date == null) return DateOption.noDate.title;

    final today = DateTime.now();
    if (_isSameDay(date, today)) return DateOption.today.title;

    final nextMonday = today.add(Duration(days: (8 - today.weekday) % 7));
    if (_isSameDay(date, nextMonday)) return DateOption.nextMonday.title;

    final nextTuesday = today.add(Duration(days: (9 - today.weekday) % 7));
    if (_isSameDay(date, nextTuesday)) return DateOption.nextTuesday.title;

    final nextWeek = today.add(const Duration(days: 7));
    if (_isSameDay(date, nextWeek)) return DateOption.nextWeek.title;

    // If no predefined date option matches, return formatted date
    return DateFormat('d MMM yyyy').format(date);
  }

  // Helper function to compare dates by day, month, and year
  static bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Method to get the date based on a provided title
  static DateTime? getDateForTitle(String title) {
    final today = DateTime.now();

    if (title == DateOption.today.title) return today;
    if (title == DateOption.nextMonday.title) {
      return today.add(Duration(days: (8 - today.weekday) % 7));
    }
    if (title == DateOption.nextTuesday.title) {
      return today.add(Duration(days: (9 - today.weekday) % 7));
    }
    if (title == DateOption.nextWeek.title) {
      return today.add(const Duration(days: 7));
    }
    if (title == DateOption.noDate.title) return null;

    // Attempt to parse a custom date in "d MMM yyyy" format
    try {
      return DateFormat('d MMM yyyy').parse(title);
    } catch (e) {
      throw FormatException('Invalid date format: $title');
    }
  }
}
