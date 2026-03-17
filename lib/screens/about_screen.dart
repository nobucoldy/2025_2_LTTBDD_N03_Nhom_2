import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../data/language_data.dart';

class AboutScreen extends StatelessWidget {
  final String locale;

  const AboutScreen({super.key, required this.locale});

  String t(String key) => localizedText[locale]?[key] ?? key;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t('about_appbar_title')),
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t('about_group_title'),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.purple[200] : Colors.purple,
              ),
            ),
            const SizedBox(height: 10),
            _buildMemberTile('Nguyễn Quế Bắc', '23010574', isDark),
            _buildMemberTile('Hoàng Tuấn Kiệt', '23010517', isDark),

            const SizedBox(height: 40),

            Center(
              child: Column(
                children: [
                  Text(
                    t('about_github_link'),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: QrImageView(
                      data:
                          "https://github.com/nobucoldy/2025_2_LTTBDD_N03_Nhom_2.git",
                      version: QrVersions.auto,
                      size: 160.0,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Colors.black,
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    t('about_scan_hint'),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberTile(String name, String mssv, bool isDark) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: isDark ? Colors.purple[300] : Colors.purple,
        child: const Icon(Icons.person, color: Colors.white),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      subtitle: Text(
        '${t('about_id_label')}: $mssv',
        style: TextStyle(color: isDark ? Colors.white60 : Colors.black54),
      ),
    );
  }
}
