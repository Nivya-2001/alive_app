import 'package:alive_app/app/widgets/stream_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              _buildAppBar(),
              _buildTabs(),
              _buildRegionChips(),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount =
                        constraints.maxWidth > 600 ? 3 : 2;
                    return GridView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: controller.streams.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: 0.62,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) =>
                          StreamCard(stream: controller.streams[index]),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Alive',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          Row(
            children: [
              Stack(
                children: [
                  const Icon(Icons.notifications_none, color: Colors.white),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: const Text('3',
                          style: TextStyle(color: Colors.white, fontSize: 8)),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              CircleAvatar(
                backgroundColor: const Color(0xFF1FA855),
                child: const Icon(Icons.account_balance_wallet,
                    color: Colors.white, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: ['Stream', 'Hot', 'Follow'].map((tab) {
              final isActive = controller.selectedTab.value == tab;
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () => controller.changeTab(tab),
                  child: Text(
                    tab,
                    style: TextStyle(
                      color: isActive ? const Color(0xFFA8E063) : Colors.grey,
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }

  Widget _buildRegionChips() {
    final regions = ['Global', 'India', 'Philippines', 'Brazil'];
    return Obx(() => SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: regions.length,
            itemBuilder: (context, index) {
              final region = regions[index];
              final isActive = controller.selectedRegion.value == region;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(region),
                  selected: isActive,
                  onSelected: (_) => controller.changeRegion(region),
                  selectedColor: const Color(0xFFA8E063),
                  backgroundColor: Colors.grey[900],
                  labelStyle: TextStyle(
                      color: isActive ? Colors.black : Colors.white),
                ),
              );
            },
          ),
        ));
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      color: const Color(0xFF0D0D0D),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home, 'Home', true),
          _navItem(Icons.celebration, 'Party', false),
          const SizedBox(width: 40),
          _navItem(Icons.send, 'Chats', false),
          _navItem(Icons.person, 'Profile', false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? const Color(0xFFA8E063) : Colors.grey),
        Text(label,
            style: TextStyle(
                fontSize: 10,
                color: active ? const Color(0xFFA8E063) : Colors.grey)),
      ],
    );
  }
}