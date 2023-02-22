import 'package:flutter/material.dart';
import 'package:flutter_binary_tree/binary_tree_view.dart';
import 'package:flutter_binary_tree/bloc/tree_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {

   HomeScreen({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Binary Search Tree"),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: TextField(controller: _controller,
                onSubmitted: (value) {
                  if(_controller.text == ""){
                    return;
                  }
                  context.read<TreeBloc>().add(AddValueEvent(value: int.parse(_controller.text)));
                  _controller.clear();
      
                },
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(onPressed: (){
              if(_controller.text == ""){
                    return;
                  }
              context.read<TreeBloc>().add(AddValueEvent(value: int.parse(_controller.text)));
              _controller.clear();
            }, child: const Text("Enter a number")),
            const Text("Root"),
            const Icon(Icons.arrow_downward),
             const BinaryTreeView(),
          ],
          
        ),
      )
    );
  }
}