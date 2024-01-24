import 'package:flutter/material.dart';
import 'package:flutter_task/data/model/hive_model/cat_holder.dart';
import 'package:flutter_task/data/source/local/hive/hive_helper.dart';
import 'package:flutter_task/utils/utils.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final facts = HiveHelper.getFacts();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        automaticallyImplyLeading: true,
        title: const Text('Facts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(child: ListView.builder(
              itemCount: facts.length,
              itemBuilder: (context, index) => historyItem(facts[index])))
        ],
      ),
    );
  }
}

Widget historyItem(CatHolder catHolder) {
  return Container(
    margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.grey
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(catHolder.text ?? '', style: const TextStyle(fontSize: 16, color: Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis),
        Text(getCurrentFormattedDate(catHolder.createdAt ?? ''), style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),),
      ],
    ),
  );
}
