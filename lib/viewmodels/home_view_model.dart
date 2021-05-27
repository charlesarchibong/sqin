import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:sqin/services/navigation_service.dart';
import 'package:sqin/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  final NavigationService navigationService;
  HomeViewModel({
    @required this.navigationService,
  });

  double selectedDailyGoal = 0;
  double achieveGoal = 0;
  int percentageAchieve = 0;

  void setDailyGoal(int goal) {
    Logger().i(goal);
    selectedDailyGoal = goal.toDouble();
    achieveGoal = 0;
    percentageAchieve = 0;
    notifyListeners();
    navigationService.pop();
  }

  void increaseAchiveGoal() {
    if (achieveGoal < selectedDailyGoal) {
      achieveGoal++;
    }
    double percent =
        ((selectedDailyGoal - achieveGoal) / selectedDailyGoal) * 100;
    Logger().i(100 - percent);
    percentageAchieve = (100 - percent).toInt();
    notifyListeners();
  }

  void decieveAchiveGoal() {
    if (achieveGoal != 0.0) {
      achieveGoal--;
    }
    double percent =
        ((selectedDailyGoal - achieveGoal) / selectedDailyGoal) * 100;
    Logger().i(100 - percent);
    percentageAchieve = (100 - percent).toInt();
    notifyListeners();
  }
}
