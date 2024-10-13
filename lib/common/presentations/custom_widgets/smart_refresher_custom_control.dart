import 'package:amplify/core/state_models/enums/page_state_enum.dart';
import 'package:amplify/core/state_models/page_state.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class SmartRefresherCustomControl {
  static const footer = ClassicFooter(
    idleText: "Pull up to load more",
  );

  void handleController({
    required PageState state,
    required RefreshController controller,
    required int listLength,
    required int totalCount,
  }) {
    if (state.state == PState.ready && controller.isRefresh) {
      controller.refreshCompleted();
    }
    if (state.state == PState.ready) {
      if (listLength >= totalCount) {
        controller.loadNoData();
      } else {
        controller.loadComplete();
      }
    }
    if (state.state == PState.loading) {
      controller.resetNoData();
    }
  }

  bool checkEnablePullUp(
      {required PageState pageState, required int listLength}) {
    return pageState.state == PState.fail || listLength == 0 ? false : true;
  }

  bool checkEnablePullDown(
      {required PageState pageState, required int listLength}) {
    return pageState.state == PState.fail || listLength == 0 ? false : true;
  }
}
