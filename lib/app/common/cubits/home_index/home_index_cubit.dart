import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_index_state.dart';

class HomeIndexCubit extends Cubit<HomeIndexState> {
  HomeIndexCubit() : super(const HomeIndexState(currentIndex: 0));

  void setCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
