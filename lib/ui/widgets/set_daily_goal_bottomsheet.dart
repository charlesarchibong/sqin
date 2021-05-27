import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqin/locator.dart';
import 'package:sqin/touchables/touchable_opacity.dart';
import 'package:sqin/viewmodels/home_view_model.dart';

class SetGoalModalButtomSheet extends StatefulWidget {
  SetGoalModalButtomSheet({Key key}) : super(key: key);

  @override
  _SetGoalModalButtomSheetState createState() =>
      _SetGoalModalButtomSheetState();
}

class _SetGoalModalButtomSheetState extends State<SetGoalModalButtomSheet> {
  int _selectedLitre;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change your daily goal',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TouchableOpacity(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
              ],
            ),
            Gap(30),
            Expanded(
              // width: double.infinity,
              // height: 200,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 1),
                children: List.generate(
                  10,
                  (index) {
                    return LittleTextWidget(
                      text: (index + 1).toString(),
                    );
                  },
                ),
                onSelectedItemChanged: (value) {
                  _selectedLitre = value;
                },
              ),
            ),
            Gap(30),
            TouchableOpacity(
              onTap: () {
                if (_selectedLitre != null)
                  sl<HomeViewModel>().setDailyGoal(_selectedLitre + 1);
              },
              child: Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Color(0xffF1768A),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Save new goal',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LittleTextWidget extends StatelessWidget {
  final String text;
  const LittleTextWidget({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text l',
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          fontSize: 24,
          color: Color(0xff232326),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
