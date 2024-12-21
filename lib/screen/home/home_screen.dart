import 'package:blueferns_machine_test/logic/home/home_bloc.dart';
import 'package:blueferns_machine_test/screen/common_widgets/app_bar_widgets.dart';
import 'package:blueferns_machine_test/screen/common_widgets/text_widget.dart';
import 'package:blueferns_machine_test/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetFilterItems());
    return Scaffold(
      appBar: primaryAppBar(title: "Filter Options"),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final list = state.filterModel?.data ?? [];
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Visibility(
                      visible: state.filterItems.isNotEmpty,
                      child: SizedBox(
                        width: getSize(context).width,
                        height: 60,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.filterItems.length,
                            itemBuilder: (context, index) {
                              final filtItemName = state.filterItems[index];
                              return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CloseButton(
                                      onPressed: () {
                                        context.read<HomeBloc>().add(AddFilter(
                                            filterItem: filtItemName));
                                      },
                                    ),
                                    TextWidget(text: filtItemName),
                                  ]);
                            }),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final items = list[index];
                            final subCatNum = items.taxonomies
                                .where((subItem) => state.filterItems
                                    .contains(subItem.name ?? "N/A"))
                                .length;
                            return ExpansionTile(
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide.none),
                                title: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextWidget(
                                      text: items.name,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Visibility(
                                      visible: subCatNum > 0,
                                      child: TextWidget(
                                        text: "(${subCatNum.toString()})",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                children: List.generate(items.taxonomies.length,
                                    (index) {
                                  final subItems = items.taxonomies[index];
                                  final itemName = subItems.name ?? "N/A";
                                  final isSelected =
                                      state.filterItems.contains(itemName);
                                  return ListTile(
                                    onTap: () {
                                      context
                                          .read<HomeBloc>()
                                          .add(AddFilter(filterItem: itemName));
                                    },
                                    leading: Icon(
                                        isSelected
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_off,
                                        color: isSelected
                                            ? Colors.blue
                                            : Colors.grey),
                                    title: TextWidget(
                                      text: itemName,
                                      color: Colors.black,
                                    ),
                                  );
                                }));
                          }),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
