import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TCardSetting extends StatelessWidget {
  const TCardSetting({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:TSizes.defaultSpace * 2),
      child: Row(
        children: [
          Icon(icon, color: TColors.primary),
          const SizedBox(width: TSizes.defaultSpace),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodyLarge,maxLines: 2,overflow: TextOverflow.ellipsis,),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall,maxLines: 2,overflow: TextOverflow.ellipsis,  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
