String timeAmPm(int hour) {
  if (hour >= 12) {
    return "PM";
  } else {
    return "AM";
  }
}

int hourConversion(int hour) {
  if (hour > 12) {
    return hour - 12;
  } else if (hour == 0) {
    return hour + 12;
  } else {
    return hour;
  }
}

String timeString(int hour, int minute) {
  String ts = "";
  ts += "${hourConversion(hour).toString()}:";
  if (minute < 10) {
    ts += "0";
  }
  ts += "${minute.toString()} ${timeAmPm(hour)}";
  return ts;
}