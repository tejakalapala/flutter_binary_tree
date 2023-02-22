part of 'tree_bloc.dart';

@immutable
abstract class TreeState extends Equatable {
  const TreeState();
  @override
  
  List<Object> get props => [];
}
class TreeInitialState extends TreeState{}

class TreeAddedState extends TreeState{
  final Node node;
   const TreeAddedState(this.node);
   @override
     List<Object> get props => [node];
}