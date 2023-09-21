import 'package:flutter/material.dart';
import 'package:job_tasks/common/common_function.dart/padding.dart';
import 'package:job_tasks/contants/app_color.dart';
import 'package:job_tasks/feature/auth/controller/auth_controller.dart';
import 'package:job_tasks/feature/home/data/data.dart';
import 'package:job_tasks/feature/home/widget/home_card.dart';
import 'package:job_tasks/utils/theme/font_manager.dart';
import 'package:job_tasks/utils/theme/style_manager.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class HomePaage extends StatelessWidget {
  const HomePaage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                padding6,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Salvati',
                      style: getBoldStyle(
                          color: AppColors.blackColor,
                          fontSize: MyFonts.size36),
                    ),
                    InkWell(
                      onTap: () {
                        AuthController.authInstance.signOut();
                      },
                      child: Text(
                        'Logout',
                        style: getBoldStyle(
                            color: AppColors.appMainColor,
                            fontSize: MyFonts.size13),
                      ),
                    )
                  ],
                ),
                padding12,
                ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: persons
                      .map(
                        (Person person) => SwipeableTile(
                          color: Colors.white,
                          swipeThreshold: 0.2,
                          direction: SwipeDirection.horizontal,
                          isElevated: false,
                          borderRadius: 0,
                          onSwiped: (_) {
                            // final index = persons.indexOf(person);

                            // setState(() {
                            //   persons.removeAt(index);
                            // });
                          },
                          backgroundBuilder: (
                            _,
                            SwipeDirection direction,
                            AnimationController progress,
                          ) {
                            if (direction == SwipeDirection.endToStart) {
                              return Container(color: Colors.blue);
                            } else if (direction == SwipeDirection.startToEnd) {
                              return Container(color: AppColors.swipe);
                            }
                            return Container();
                          },
                          key: UniqueKey(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: HomeCard(
                              person: person,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
