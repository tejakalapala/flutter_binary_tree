import 'package:flutter/material.dart';
import 'package:flutter_binary_tree/bloc/tree_bloc.dart';
import 'package:flutter_binary_tree/models/node.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class BinaryTreeView extends StatelessWidget {
  const BinaryTreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TreeBloc, TreeState>(
      builder: (context, state) {
        if(state is TreeAddedState){
        return _createBST(state.node);
        }else{
          return Container();
        }
      },
    );
  }

  Widget _createBST(Node? node) {
    
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child:  node?.data == null
                              ? Container()
                              : binaryTree(node),
                        );
            
      }

  Column binaryTree(Node? node) {
    
    return Column(
          children: [
            //  (node?.right?.data == null && node?.left?.data == null)? const Text("Root"):Container(),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                 
                    child: AnimatedContainer(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                        duration: const Duration(seconds: 1),
                        child: Center(
                          child: Text('${node?.data}'),
                              ),
                            ),
                  
                        ),
                        Row(
                          children: [
                            node?.left?.data != null? Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Transform.rotate(angle: 120 * math.pi /180,
                              child: const Icon(Icons.arrow_right_alt,size: 40,)),
                            ):Container(),
                            node?.right?.data != null? Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Transform.rotate(angle: 45 * math.pi /180,
                              child: const Icon(Icons.arrow_right_alt,size: 40,)),
                            ):Container(),
                        
                          ],
                        ),
                                  
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: _createBST(node?.left),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: _createBST(node?.right),
                                ),
                              ],
                            ),
                          ],
                        );
  }
  }

  

