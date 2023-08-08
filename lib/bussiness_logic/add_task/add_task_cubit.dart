import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bussiness_logic/add_task/add_task_states.dart';

class AddTaskCubit extends Cubit<AddTaskStates>{
  AddTaskCubit() : super(AddTaskInitialState());
  BlocProvider<AddTaskCubit> get(context) => BlocProvider.of(context);
  void addTask() async{
    emit(AddTaskLoadingState());
    Future.delayed(const Duration(seconds: 2), () {
      emit(AddTaskSuccessState());
    });
  }
}