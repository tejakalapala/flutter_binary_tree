part of 'tree_bloc.dart';

@immutable
abstract class TreeEvent extends Equatable {}
class AddValueEvent extends TreeEvent{
  final int? value;
  
   AddValueEvent({this.value});
   
     @override
    
     List<Object?> get props => [value];
  
  
}