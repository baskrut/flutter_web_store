import 'package:web_store/services/dialog_service/i_dialog.dart';
import 'package:web_store/utils/base_action.dart';

/// Action need it for close any dialogs.
class ForceCloseDialogAction extends BaseAction {
  ForceCloseDialogAction() : super(type: 'ForceCloseDialogAction');
}


/// Action for show any dialogs what will extends from [IDialog] interface.
class ShowDialogAction extends BaseAction {
  final IDialog dialog;

  ShowDialogAction({this.dialog}) : super(type: 'ShowDialogAction');
}
