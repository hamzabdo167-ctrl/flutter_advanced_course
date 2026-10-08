import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_new_app/core/theming/colors.dart';
import 'package:my_new_app/core/theming/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello!', style: TextStyles.font18DarkBlueBold),
              Text('How are you today?', style: TextStyles.font12GrayRegular),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 24.0,
            backgroundColor: ColorsManager.moreLighterGray,
            child: SvgPicture.asset('assets/svgs/notification.svg'),
          ),
        ],
      ),
    );
  }
}
