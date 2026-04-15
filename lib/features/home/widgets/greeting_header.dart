import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/helpers.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Helpers.getIconGreeting(),
                    size: 26,
                    color: AppColors.primaryDark,
                  ),
                  Text(
                    '  ${Helpers.getGreeting()}',
                    
                    style: AppTextStyles.bodyLarge,
                  ), 
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Looking for a meal?',
                style: AppTextStyles.h3,
              ),
            ],
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primarySurface,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 2),
          ),
          child: const Icon(
            Icons.person_rounded,
            color: AppColors.primary,
            size: 28,
          ),
        ),
      ],
    );
  }
}
