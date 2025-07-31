import 'package:kiwi/app/generic/generic_state.dart';
import 'package:kiwi/presentation/components/bottom-sheet/primary_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenericListener<B extends StateStreamable<S>, S> extends BlocListener<B, S> {
  const GenericListener({
    super.key,
    required super.listener,
    super.child,
  });

  @override
  BlocWidgetListener<S> get listener {
    return (context, state) {
      super.listener(context, state);

      if (state is Failure) {
        PrimaryBottomSheet.show(context, text: state.error.message);
      }
    };
  }
}
