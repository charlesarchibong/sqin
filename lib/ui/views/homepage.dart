import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqin/constant/app_assets.dart';
import 'package:sqin/touchables/touchable_opacity.dart';
import 'package:sqin/ui/shared/base_view.dart';
import 'package:sqin/viewmodels/home_view_model.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(
                          AppAssets.notificationIcon,
                        ),
                      ),
                    ],
                  ),
                  Gap(7),
                  Text(
                    'Hydration',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Gap(3),
                  Text(
                    'Description why water is important.',
                    style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(50),
                        SvgPicture.asset(
                          AppAssets.waterDropIcon,
                          height: 300,
                          width: 200,
                        ),
                        Gap(5),
                        Text(
                          '50%',
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          '1.0l / 2.0l',
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              fontSize: 30,
                              color: Color(0xffB2B2B2),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Gap(30),
                        Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffEAF1F4),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Daily goal',
                              style: GoogleFonts.nunitoSans(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gap(50),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ActionButtonWidget(),
                            Gap(50),
                            ActionButtonWidget(
                              isAddAction: false,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class ActionButtonWidget extends StatelessWidget {
  final bool isAddAction;
  final VoidCallback onTap;
  const ActionButtonWidget({
    Key key,
    this.isAddAction = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Color(0xff6FA9C2),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          isAddAction ? Icons.add_rounded : Icons.remove_rounded,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
