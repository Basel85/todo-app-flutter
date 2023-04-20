import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/ui/cubits/task_color/task_color_states.dart';

class TaskColorCubit extends Cubit<TaskColorStates> {
  TaskColorCubit() : super(TaskColorInitialState());
  static TaskColorCubit get(context) => BlocProvider.of(context);
  int taskColorIndex = 0;
  void changeTaskColorIndex(int index) {
    taskColorIndex = index;
    emit(TaskColorChangeIndexState());
  }
}
