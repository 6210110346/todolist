part of 'stats_bloc.dart';

class StatsState extends Equatable {
  int activeNum;
  int completeNum;
  StatsState(this.activeNum, this.completeNum);

  StatsState copyWith({activeNum, completeNum}) {
    return StatsState(
        activeNum ?? this.activeNum, completeNum ?? this.completeNum);
  }

  @override
  List<Object> get props => [];
}
