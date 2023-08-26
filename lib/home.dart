import 'package:demo_state_managements/cubit_provider/cubit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Cubit"),
      ),
      body: BlocBuilder<>(builder: (_, index) {
        return 
      })
    );
  }
}
