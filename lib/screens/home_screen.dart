import 'package:flutter/material.dart';
import 'about_screen.dart';
import '../widgets/plan_card.dart';
import '../widgets/filter_chip.dart';
import '../widgets/app_drawer.dart';
import '../widgets/add_plan_bottom_sheet.dart';
import '../data/plan_data.dart';
import '../data/category_data.dart';
import '../models/category_model.dart';
import 'plan_detail_screen.dart';
import '../utils/plan_group.dart';

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
  bool _isSettingsExpanded = false;
  int _selectedIndex = 0;
  late CategoryModel? _selectedCategory;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isSearching = false;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCategory = null;
  }

  Widget _buildMainContent() {
    final filteredPlans = samplePlans.where((plan) {
      final matchesCategory =
          _selectedCategory == null ||
          plan.category?.id == _selectedCategory!.id;

      final matchesSearch =
          _searchQuery.isEmpty ||
          plan.title.toLowerCase().contains(_searchQuery);

      return matchesCategory && matchesSearch;
    }).toList();

    if (filteredPlans.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'Không tìm thấy kế hoạch phù hợp',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    final groupedPlans = groupPlansByTime(filteredPlans);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedPlans.entries.map((entry) {
        if (entry.value.isEmpty) return Container();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 4),
                child: Text(
                  entry.key,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Column(
                children: entry.value.map((plan) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlanDetailScreen(plan: plan),
                        ),
                      );
                    },
                    child: planCard(plan),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged,
        isSettingsExpanded: _isSettingsExpanded,
        onNavigate: (value) {
          Navigator.pop(context);

          if (value == 'about') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutScreen()),
            );
            return;
          }

          if (value == 'settings') {
            setState(() {
              _isSettingsExpanded = !_isSettingsExpanded;
            });
          }
        },
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

                _isSearching
                    ? Expanded(
                        child: TextField(
                          controller: _searchController,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Tìm kế hoạch...',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _isSearching = false;
                                  _searchQuery = '';
                                  _searchController.clear();
                                });
                              },
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value.toLowerCase();
                            });
                          },
                        ),
                      )
                    : IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            _isSearching = true;
                          });
                        },
                      ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = null;
                      });
                    },
                    child: filterChip(
                      'Tất cả',
                      isSelected: _selectedCategory == null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ...sampleCategories.map((category) {
                    final isSelected = _selectedCategory?.id == category.id;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                        child: filterChip(
                          category.name,
                          isSelected: isSelected,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(child: SingleChildScrollView(child: _buildMainContent())),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) async {
          if (index == 1) {
            final newPlan = await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => const AddPlanBottomSheet(),
            );

            if (newPlan != null) {
              setState(() {
                samplePlans.add(newPlan);
              });
            }
            return;
          }

          setState(() {
            _selectedIndex = index;
          });
        },
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
