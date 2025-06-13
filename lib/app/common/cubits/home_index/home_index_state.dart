import 'package:equatable/equatable.dart';

class HomeIndexState with EquatableMixin {
  final int currentIndex;

  const HomeIndexState({required this.currentIndex});

  HomeIndexState copyWith({int? currentIndex}) {
    return HomeIndexState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props => [currentIndex];
}
