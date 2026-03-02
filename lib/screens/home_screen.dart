import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                filterContainer('Tất cả'),
                filterContainer('Học tập'),
                filterContainer('Công việc'),
                filterContainer('Tài chính'),
                filterContainer('Sức khỏe'),
              ],
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: const [
                  PlanContainer(text: 'Kế hoạch 1'),
                  PlanContainer(text: 'Kế hoạch 2'),
                  PlanContainer(text: 'Kế hoạch 3'),
                  PlanContainer(text: 'Kế hoạch 4'),
                  PlanContainer(text: 'Kế hoạch 5'),
                  PlanContainer(text: 'Kế hoạch 6'),
                  PlanContainer(text: 'Kế hoạch 7'),
                  PlanContainer(text: 'Kế hoạch 8'),
                  PlanContainer(text: 'Kế hoạch 9'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Kế hoạch',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Thêm'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Của tôi'),
        ],
      ),
    );
  }

  Widget filterContainer(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }
}

class PlanContainer extends StatelessWidget {
  final String text;
  const PlanContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const Icon(Icons.delete_forever_outlined, color: Colors.white),
        ],
      ),
    );
  }
}
