import 'package:flutter/material.dart';

class AddPlanBottomSheet extends StatelessWidget {
  const AddPlanBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.all(16),
      child: const Center(child: Text('Thêm')),
    );
  }
}
