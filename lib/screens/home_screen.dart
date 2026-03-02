import 'package:flutter/material.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentContent = 'home'; // Quản lý nội dung hiển thị: home hoặc about
  bool _isSettingsExpanded = false; // Quản lý đóng/mở mục Cài đặt
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Widget hiển thị nội dung chính dựa trên trạng thái chọn
  Widget _buildMainContent() {
    if (_currentContent == 'about') {
      // Khi chọn About, hiển thị nội dung trang About
      return const AboutScreen();
    }

    // Mặc định hiển thị danh sách kế hoạch
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(child: Text("Nội dung sẽ hiển thị ở đây")),
        ),
        _buildPlanItem('Kế hoạch 1'),
        _buildPlanItem('Kế hoạch 2'),
      ],
    );
  }

  // Widget cho từng dòng kế hoạch của cậu
  Widget _buildPlanItem(String title) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Icon(Icons.delete_forever_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }

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
            // Nút About: Bấm vào đổi nội dung main
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () {
                setState(() => _currentContent = 'about');
                Navigator.pop(context);
              },
            ),
            // Nút Cài đặt: Bấm vào xổ xuống mục con
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Cài đặt'),
              trailing: Icon(
                _isSettingsExpanded ? Icons.expand_less : Icons.expand_more,
              ),
              onTap: () {
                setState(() => _isSettingsExpanded = !_isSettingsExpanded);
              },
            ),
            if (_isSettingsExpanded)
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  leading: const Icon(Icons.palette_outlined, size: 20),
                  title: const Text(
                    'Chế độ tối',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Switch(
                    value: widget.isDarkMode,
                    activeColor: Colors.blue,
                    onChanged: (val) => widget.onThemeChanged(val),
                  ),
                ),
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
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
                // Bấm vào logo/Search có thể reset về trang Home cho tiện
                IconButton(
                  icon: const Icon(Icons.home_outlined),
                  onPressed: () => setState(() => _currentContent = 'home'),
                ),
              ],
            ),
            // Chỉ hiện Chip khi ở trang Home
            if (_currentContent == 'home')
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children:
                      [
                            'Tất cả',
                            'Học tập',
                            'Công việc',
                            'Tài chính',
                            'Sức khỏe',
                          ]
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: _buildCategoryChip(e),
                            ),
                          )
                          .toList(),
                ),
              ),
            const SizedBox(height: 10),
            // Hiển thị nội dung động ở đây
            Expanded(child: SingleChildScrollView(child: _buildMainContent())),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
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
}
