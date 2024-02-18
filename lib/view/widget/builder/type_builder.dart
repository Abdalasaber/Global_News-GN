import 'package:flutter/material.dart';
import 'package:news_api_app/model/type_model/type_model.dart';
import '../default_text.dart';

class TypeBuilder extends StatelessWidget {
  final TypeModel typeModel;
  final Function(int) onCategorySelected;
  final int selectedCategoryIndex;

  const TypeBuilder(
      {super.key,
      required this.typeModel,
      required this.onCategorySelected,
      required this.selectedCategoryIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Theme.of(context).scaffoldBackgroundColor,
      highlightColor: Theme.of(context).scaffoldBackgroundColor,
      onTap: () {
        onCategorySelected(itemTypeModel.indexOf(typeModel));
      },
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: selectedCategoryIndex == itemTypeModel.indexOf(typeModel)
                  ? typeModel.selectedColor ?? typeModel.color
                  : Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Icon(typeModel.icon, size: 35),
          ),
          const SizedBox(height: 4),
          Center(
            child: DefaultText(text: typeModel.text),
          ),
        ],
      ),
    );
  }
}
