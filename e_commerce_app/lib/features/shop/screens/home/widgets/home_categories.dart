import 'package:flutter/material.dart';

import '../../../../../common/widgets/images_text_widgets/vertical_images_widget.dart';
import '../../../../../utils/constants/images_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: TImages.shoesIcon,
            title: 'Shoes',
            onTap: (){},
          );
        },
      ),
    );
  }
}