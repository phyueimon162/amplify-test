import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/features/book/domains/entities/book.dart';
import 'package:amplify/features/book/presentations/books/views/book_image_view.dart';
import 'package:amplify/features/book/presentations/books/views/rank_view.dart';
import 'package:amplify/features/book/presentations/books/views/read_button_view.dart';
import 'package:flutter/material.dart';

class BookItemCard extends StatelessWidget {
  final int index;
  final Book book;

  const BookItemCard({
    super.key,
    required this.book,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Positioned(
            left: AppDimensions.w10(context),
            top: AppDimensions.h20(context),
            right: AppDimensions.w10(context),
            bottom: AppDimensions.h10(context),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(AppDimensions.r15(context)),
              ),
              child: SizedBox(
                width: AppDimensions.w30(context) * 2.4,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AppDimensions.w20(context),
                      top: AppDimensions.h15(context),
                      bottom: AppDimensions.h15(context),
                      right: AppDimensions.width(context) * 0.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(book.author.toString(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: AppTheme.of(context).bodySmall),
                      SizedBox(
                        height: AppDimensions.h10(context) * 0.5,
                      ),
                      Text(
                        book.title.toString(),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.of(context).titleSmall.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.of(context).primaryText,
                            ),
                      ),
                      const Expanded(child: SizedBox()),
                      Row(
                        children: [
                          RankView(book.rank.toString()),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(book.description.toString(),
                                maxLines: 3,
                                style: AppTheme.of(context).bodySmall),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: AppDimensions.w30(context),
            bottom: AppDimensions.h40(context) * 1.7,
            child: BookImageView(book.bookImage),
          ),
          Positioned(
              right: AppDimensions.w10(context),
              bottom: AppDimensions.h10(context),
              child: const ReadButtonView()),
        ],
      ),
    );
  }
}
