abstract class TaskColorStates {}

class TaskColorInitialState extends TaskColorStates {}

class TaskColorChangedIndexState extends TaskColorStates {
  final int taskColorPrevIndex;
  final int taskColorCurrentIndex;

  TaskColorChangedIndexState(this.taskColorPrevIndex, this.taskColorCurrentIndex);
}
