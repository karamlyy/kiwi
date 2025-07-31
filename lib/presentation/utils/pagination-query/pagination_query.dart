import 'package:dartz/dartz.dart';
import 'package:kiwi/data/exception/error.dart';
import 'package:kiwi/presentation/shared/string_x.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

typedef RequestDef<T> = Future<Either<HttpException, List<T>>> Function(int args);

class PaginationQuery<T> {
  final PagingController<int, T> pagingController;
  final RequestDef<T> future;

  int nextPageKey = 0;

  PaginationQuery(this.pagingController, this.future) {
    pagingController.addPageRequestListener((pageKey) async {
      final Either<HttpException, List<T>> result = await future(pageKey);
      final isLastPage = result.asRight().isEmpty;
      if (isLastPage && result.isRight()) {
        pagingController.appendLastPage(result.asRight());
      } else {
        if (result.isRight()) {
          nextPageKey++;
          pagingController.appendPage(result.asRight(), nextPageKey);
        }
      }
    });
  }
}
