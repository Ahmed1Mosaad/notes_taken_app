import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/NoteForHomePage/NotesCubit/notes_states.dart';
import 'package:notes_application/models/container_item_model.dart';

class NotesCubit extends Cubit<NotesStates>{
  NotesCubit():super(InitialNotesState()){}
  List<ContainerItemModel>? modelList;

  getNotes(){
    final box = Hive.box<ContainerItemModel>(NoteBox1);
    modelList = box.values.toList();
    emit(SuccessNotesState(modelList: modelList!));
  }
  
}
