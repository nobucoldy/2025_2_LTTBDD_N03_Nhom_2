import 'package:flutter/material.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildCategoryChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.purple),
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Cài đặt'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Tất cả',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Học tập',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Công việc',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Tài chính',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Sức khỏe',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Kế hoạch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40, color: Colors.purple),
            label: 'Thêm',
          ),
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
