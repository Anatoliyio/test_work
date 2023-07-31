class DateTimeState {
  final String ? date;

  final String ? time;

  DateTimeState({
    this.date,
    this.time,
  });

  String? get getDateNumber => (date);
  String? get getDateStr => date;

  DateTimeState copyWith({
    String? date,
    String? time,
  }) {
    return DateTimeState(
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
}
