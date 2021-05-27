import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                
              ],
            ),
          ),
        ),
      );
    });
  }
}
