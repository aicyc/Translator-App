import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../utils/utils_translator.dart';
import 'history_cubit/history_cubit.dart';
import 'widgets/item_history.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late final historyCubit = BlocProvider.of<HistoryCubit>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History'),
        leading: UtilsTranslator.goBackButton,
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          final historyModels = state.historyModels;
          if (historyModels.isEmpty) {
            return Center(
              child: Text(
                'Your history is empty',
                style: Get.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            itemCount: historyModels.length,
            itemBuilder: (ctx, i) => ItemHistory(
              historyModel: historyModels[i],
              onDismissed: () => historyCubit.deleteHistory(historyModels[i]),
            ),
          );
        },
      ),
    );
  }
}
