import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  // Cần 2 dòng này để nhận dữ liệu từ HomeScreen truyền sang
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const SettingsScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isSoundOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          // Mục 1: Âm thanh
          ListTile(
            leading: const Icon(Icons.volume_up),
            title: const Text('Âm thanh'),
            trailing: Switch(
              value: _isSoundOn,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _isSoundOn = value;
                });
              },
            ),
          ),
          const Divider(),
          // Mục 2: Giao diện Sáng/Tối
          ListTile(
            leading: Icon(
              widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            title: const Text('Chế độ tối'),
            trailing: Switch(
              value: widget.isDarkMode,
              activeColor: Colors.blue,
              onChanged: (value) {
                // Gọi hàm đổi màu đã truyền từ main qua home vào đây
                widget.onThemeChanged(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
