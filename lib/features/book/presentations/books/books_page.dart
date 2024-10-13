import 'package:amplify/common/presentations/custom_widgets/fail_widget.dart';
import 'package:amplify/common/presentations/custom_widgets/no_record.dart';
import 'package:amplify/common/presentations/custom_widgets/page_background/bezier_page_background.dart';
import 'package:amplify/common/presentations/custom_widgets/smart_refresher_custom_control.dart';
import 'package:amplify/common/presentations/navigation/app_route.dart';
import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/core/state_models/enums/action_state_enum.dart';
import 'package:amplify/core/state_models/enums/page_state_enum.dart';
import 'package:amplify/features/authentication/presentations/account/controllers/account_controller.dart';
import 'package:amplify/features/book/presentations/books/controllers/books_controller.dart';
import 'package:amplify/features/book/presentations/books/views/book_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class BooksPage extends ConsumerStatefulWidget {
  const BooksPage({super.key});

  @override
  ConsumerState<BooksPage> createState() {
    return _State();
  }
}

class _State extends ConsumerState<BooksPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    ref.listenManual(accountControllerProvider, (prev, next) {
      if (next.actionState.state == AState.actionFail) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(next.actionState.msg),
        ));
      } else if (next.actionState.state == AState.actionSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.welcomePage, (route) => route is BooksPage);
      }
    });
    Future.microtask(() {
      _onRefresh();
    });
  }

  _onRefresh({bool isLoadMore = false}) {
    ref
        .read(booksControllerProvider.notifier)
        .onFetchBooksEvent(isLoadMore: isLoadMore);
  }

  @override
  Widget build(BuildContext context) {
    var bookState = ref.watch(booksControllerProvider);

    SmartRefresherCustomControl().handleController(
      state: bookState.pageState,
      controller: _refreshController,
      listLength: bookState.books.length,
      totalCount: bookState.totalCount,
    );

    return BezierPageBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Discover Latest Books'.toUpperCase(),
            style: AppTheme.of(context).titleMedium,
          ),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(accountControllerProvider.notifier).signOut();
              },
              icon: const Icon(Icons.output),
            )
          ],
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        body: SmartRefresher(
          header: const WaterDropHeader(),
          footer: SmartRefresherCustomControl.footer,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: () {
            _onRefresh(isLoadMore: true);
          },
          enablePullUp: SmartRefresherCustomControl().checkEnablePullUp(
            pageState: bookState.pageState,
            listLength: bookState.books.length,
          ),
          enablePullDown: SmartRefresherCustomControl().checkEnablePullDown(
            pageState: bookState.pageState,
            listLength: bookState.books.length,
          ),
          child: bookState.pageState.state == PState.fail
              ? FailWidget(_onRefresh, bookState.pageState.msg)
              : bookState.books.isEmpty &&
                      bookState.pageState.state != PState.loading
                  ? NoRecord(_onRefresh)
                  : ListView.builder(
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.only(bottom: AppDimensions.h20(context)),
                      itemCount: bookState.books.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BookItemCard(
                            book: bookState.books[index], index: index);
                      },
                    ),
        ),
      ),
    );
  }
}
