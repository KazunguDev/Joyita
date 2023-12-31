// ignore_for_file: avoid_print

import 'package:cervivorbd/Utils/Exports/packages.dart';
import 'package:cervivorbd/Utils/Exports/widgets.dart';

class TestRadio extends StatelessWidget {
  const TestRadio(
      {Key? key,
      this.question,
      required this.radioButtons,
      required this.radioController,
      required this.type})
      : super(key: key);
  final String? question;
  final List<String> radioButtons;
  final GroupButtonController radioController;
  final bool type;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Text(
            ////! questions
            question!,
            style: theme.textTheme.headline5,
          ),
        ),
        GroupButton(
          controller: radioController,
          isRadio: true,
          options: const GroupButtonOptions(groupingType: GroupingType.column),
          buttons: radioButtons,
          buttonIndexedBuilder: (selected, index, context) {
            return RadioTile(
              title: radioButtons[index],
              selected: radioController.selectedIndex,
              index: index,
              onTap: () {
                radioController.selectIndex(index);
              },
            );
          },
          onSelected: (val, i, selected) =>
              print('Button: $val index: $i $selected'),
        ),
      ],
    );
  }
}
