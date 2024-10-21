import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/home/presentaion/views/widgets/status_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/themes/styles.dart';
import 'calls_screen.dart';
import 'chats_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // Current index for the BottomNavigationBar
  int _currentIndex = 0;

  // List of screens to display based on current index
  final List<Widget> _screens = [
    ChatsScreen(),
    StatusScreen(),
    CallsScreen(),
  ];

  // Sample data for chats
  final List<Map<String, dynamic>> _chatData = [
    {'name': "Mohammad", 'message': "Hello!", 'status': 'RDP'},
    {'name': "Kamel", 'message': "Are you there?", 'status': 'RDP'},
    {'name': "Nadine", 'message': "Let's meet!", 'status': 'RCP'},
    // Add more chat data here
  ];

  List<Map<String, dynamic>> _filteredChatData = [];

  @override
  void initState() {
    _filteredChatData = _chatData;
    super.initState();
  }

  void _filterChatData(String value) {
    if (value.isEmpty) {
      _filteredChatData = _chatData;
    } else {
      _filteredChatData = _chatData
          .where((chat) =>
      chat['name'].toLowerCase().contains(value.toLowerCase()) ||
          chat['message'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primaryColor, // WhatsApp's green color
        title: Text(
          "WhatsUP",
          style: Styles.textStyle24,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ChatSearchDelegate(
                  chatData: _chatData,
                  onFilter: _filterChatData,
                ),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              } else if (value == 'Settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'Profile',
                  child: Text('Profile'),
                ),
                const PopupMenuItem(
                  value: 'Settings',
                  child: Text('Settings'),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change the screen when a tab is tapped
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
        selectedItemColor: const Color(0xFF25D366),
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366), // WhatsApp FAB color
        onPressed: () {
          // Action for FAB
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}

class ChatSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, dynamic>> chatData;
  final Function(String) onFilter;

  ChatSearchDelegate({required this.chatData, required this.onFilter});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Call filter function when a search is conducted
    onFilter(query);
    return _buildResultsList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResultsList();
  }

  Widget _buildResultsList() {
    final filteredData = chatData.where((chat) {
      return chat['name'].toLowerCase().contains(query.toLowerCase()) ||
          chat['message'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        var item = filteredData[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(item['name']![0].toUpperCase()),
            backgroundColor: const Color(0xff00a982),
          ),
          title: Text(
            item['name'].toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            item['message'].toString(),
            style: const TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}
