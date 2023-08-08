abstract class AddTaskStates {}

class AddTaskInitialState extends AddTaskStates {

}

class AddTaskLoadingState extends AddTaskStates {}

class AddTaskSuccessState extends AddTaskStates {

}
class AddTaskErrorState extends AddTaskStates {
  final String errorMessage;
  AddTaskErrorState(this.errorMessage);
}
