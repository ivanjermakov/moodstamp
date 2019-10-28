import 'mood.dart';

class MoodRecord {
  static final MoodRecord empty = MoodRecord(null, DateTime.now(), '');

  final Mood mood;
  final DateTime dateTime;
  final String description;

  MoodRecord(this.mood, this.dateTime, this.description);

  MoodRecord withMood(Mood mood) {
    return MoodRecord(mood, dateTime, description);
  }

  MoodRecord withDateTime(DateTime dateTime) {
    return MoodRecord(mood, dateTime, description);
  }

  MoodRecord withDescription(String description) {
    return MoodRecord(mood, dateTime, description);
  }

  @override
  String toString() {
      return 'MoodRecord{mood: $mood, dateTime: $dateTime, description: $description}';
  }
}
