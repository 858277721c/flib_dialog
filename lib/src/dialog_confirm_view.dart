import 'package:flutter/material.dart';

import 'dialog_action_view.dart';
import 'dialog_alert_view.dart';
import 'locale.dart';

class FDialogConfirmView extends StatelessWidget {
  final Widget title;
  final Widget content;
  final FDialogAction cancel;
  final FDialogAction confirm;

  FDialogConfirmView({
    this.title,
    this.content,
    this.cancel,
    this.confirm,
  });

  factory FDialogConfirmView.simple({
    String title = '',
    String content,
    String cancel = '',
    VoidCallback cancelOnPressed,
    String confirm = '',
    VoidCallback confirmOnPressed,
    @required BuildContext context,
  }) {
    Widget contentWidget;
    if (content != null) {
      contentWidget = Text(
        content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return FDialogConfirmView.customContent(
      title: title,
      content: contentWidget,
      cancel: cancel,
      cancelOnPressed: cancelOnPressed,
      confirm: confirm,
      confirmOnPressed: confirmOnPressed,
      context: context,
    );
  }

  factory FDialogConfirmView.customContent({
    String title = '',
    Widget content,
    String cancel = '',
    VoidCallback cancelOnPressed,
    String confirm = '',
    VoidCallback confirmOnPressed,
    @required BuildContext context,
  }) {
    Widget titleWidget;
    if (title != null) {
      if (title == '') {
        title = FLibDialogLocale.tips(context);
      }

      titleWidget = Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    Widget contentWidget = content;

    FDialogAction cancelWidget;
    if (cancel != null) {
      if (cancel == '') {
        cancel = FLibDialogLocale.cancel(context);
      }

      cancelWidget = FDialogAction(
        child: Text(
          cancel,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onPressed: cancelOnPressed,
        borderRadius: confirm == null
            ? BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              )
            : BorderRadius.only(bottomLeft: Radius.circular(5.0)),
      );
    }

    FDialogAction confirmWidget;
    if (confirm != null) {
      if (confirm == '') {
        confirm = FLibDialogLocale.cancel(context);
      }

      confirmWidget = FDialogAction(
        child: Text(
          confirm,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onPressed: confirmOnPressed,
        borderRadius: cancel == null
            ? BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              )
            : BorderRadius.only(bottomRight: Radius.circular(5.0)),
      );
    }

    return FDialogConfirmView(
      title: titleWidget,
      content: contentWidget,
      cancel: cancelWidget,
      confirm: confirmWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listAction = [];

    if (cancel != null) {
      listAction.add(cancel);
    }

    if (confirm != null) {
      listAction.add(confirm);
    }

    return FDialogAlertView(
      title: title,
      content: content,
      actions: listAction,
    );
  }
}
