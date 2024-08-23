enum Exclude {
  current('current'),
  minutely('minutely'),
  hourly('hourly'),
  daily('daily'),
  alerts('alerts');

  final String value;

  const Exclude(this.value);
}
