import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/history_model/history_model.dart';

class ItemHistory extends StatefulWidget {
  const ItemHistory({
    super.key,
    required this.historyModel,
    required this.onDismissed,
  });
  final HistoryModel historyModel;
  final VoidCallback onDismissed;

  @override
  State<ItemHistory> createState() => _ItemHistoryState();
}

class _ItemHistoryState extends State<ItemHistory> {
  ValueKey get valKey => ValueKey(widget.historyModel);
  String get textFrom => widget.historyModel.textToBeTranslated;
  String get textTo => widget.historyModel.translatedText;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: valKey,
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
      ),
      confirmDismiss: deleteItem,
      child: ListTile(
        leading: '\n'.allMatches(textFrom).length > 1
            ? IconButton(
                onPressed: () => setState(() => isOpen = !isOpen),
                icon: Icon(isOpen
                    ? FontAwesomeIcons.chevronUp
                    : FontAwesomeIcons.chevronDown),
              )
            : null,
        title: Text(
          textFrom,
          maxLines: isOpen ? null : 2,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            Text(
              textTo,
              maxLines: isOpen ? null : 2,
            ),
          ],
        ),
        onTap: () {
          Get.back();
          Get.back(result: widget.historyModel);
        },
        trailing: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.trash,
            color: Theme.of(context).colorScheme.error,
          ),
          onPressed: deleteItem,
        ),
      ),
    );
  }

  Future<bool?> deleteItem([_]) async {
    var isDismiss = await showDialog();
    isDismiss ??= false;
    if (isDismiss) widget.onDismissed();

    return isDismiss;
  }

  Future<bool?> showDialog() async => Get.dialog<bool>(
        AlertDialog(
          title: const Text('Delete History'),
          content: const Text('Are you sure you want to delete this story?'),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(result: true),
              child: const Text('Delete'),
            ),
            ElevatedButton(
              onPressed: () => Get.back(result: false),
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
}
