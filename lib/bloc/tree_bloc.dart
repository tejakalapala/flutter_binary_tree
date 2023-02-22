import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_binary_tree/models/node.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tree_event.dart';
part 'tree_state.dart';

class TreeBloc extends Bloc<TreeEvent, TreeState> {
   Node? root;
  TreeBloc() : super(TreeInitialState()) {
    on<AddValueEvent>((event, emit) {
      emit(TreeInitialState());
      root = _addValue(root, event.value!);
      emit(TreeAddedState(root!));
    });
  }

  Node _addValue(Node? root, int data) {
    if (root == null) {
      return Node(data: data);
    }
if (data < root.data!) {
      root.left = _addValue(root.left, data);
    } else if (data > root.data!) {
      root.right = _addValue(root.right, data);
    }
    return root;
  }
}