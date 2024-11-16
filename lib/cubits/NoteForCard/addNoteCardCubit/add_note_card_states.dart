abstract class AddNoteCardStates {}

class InitialAddNoteCardStates extends AddNoteCardStates {}

class LoadingAddNoteCardStates extends AddNoteCardStates {}

class SuccessAddNoteCardStates extends AddNoteCardStates {}

class FailureAddNoteCardStates extends AddNoteCardStates {
  final String errMessage;

  FailureAddNoteCardStates({required this.errMessage});
}
