enum DueDate {
  Immediately(0),
  SevenDays(7),
  FourteenDays(14),
  ThirtyDays(30),
  SixtyDays(60);

  final int days;
  const DueDate(this.days);
}
