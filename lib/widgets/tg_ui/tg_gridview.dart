import 'package:flutter/material.dart';
import 'package:ibms/models/basic/app_module_mobile_model.dart';
import 'package:ibms/widgets/tg_ui/tg_image_button.dart';

class TGGridView extends StatelessWidget {
  final List<AppModuleMobileModel> displayModules;

  final int crossAxisCount;

  final bool isSpecialIcon;
  final String? specialIcon;
  final TextStyle textStyle;

  final void Function(AppModuleMobileModel model) onPressed;

  const TGGridView({
    Key? key,
    required this.displayModules,
    this.textStyle = const TextStyle(fontSize: 12),
    this.crossAxisCount = 2,
    this.isSpecialIcon = false,
    this.specialIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 10),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: displayModules.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemBuilder: (context, index) {
        AppModuleMobileModel model = displayModules[index];
        return TGImageButton(
          backgroundColor: Colors.transparent,
          image: AssetImage(!isSpecialIcon ? model.icon! : specialIcon!),
          space: 12,
          text: model.text ?? model.name,
          textStyle: textStyle,
          onPressed: () => onPressed(model),
        );
      },
    );
  }
}
