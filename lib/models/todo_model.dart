class ToDoModel {
  DateTime startDatetime; //this will be an unique id of every todoTask
  String category;
  int durationHour;
  int durationMinute;
  String austronautId;
  bool isDone;

  ToDoModel(this.startDatetime, this.category, this.durationHour,
      this.durationMinute, this.austronautId, this.isDone);
}
