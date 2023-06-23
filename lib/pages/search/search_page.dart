import 'package:flutter/material.dart';
import 'package:learning_app/common/constant/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackground,
        title: const Text("title"),
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        onPressed: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Badge(
            alignment: AlignmentDirectional.topEnd,
            label: const Text("10"),
            isLabelVisible: true,
            child: FilledButton.tonal(
              onPressed: () {},
              child: const Text("Button"),
            ),
          ),
        ],
      ),
    );
  }
}
