import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}
 
class _HomeViewState extends ConsumerState<HomeView> {
  final List<Map<String, String>> items = [
    {
      'title': 'Item 1',
      'description': 'Description of Item 1',
      'imageUrl': 'https://st3.depositphotos.com/13324256/17303/i/450/depositphotos_173034766-stock-photo-woman-writing-down-recipe.jpg',
    },
    {
      'title': 'Item 2',
      'description': 'Description of Item 2',
      'imageUrl': 'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cmVjaXBlfGVufDB8fDB8fHww',
    },
    {
      'title': 'Item 3',
      'description': 'Description of Item 3',
      'imageUrl': 'https://images.unsplash.com/photo-1485921325833-c519f76c4927?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHJlY2lwZXxlbnwwfHwwfHx8MA%3D%3D',
    },
    {
      'title': 'Item 4',
      'description': 'Description of Item 4',
      'imageUrl': 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmVjaXBlfGVufDB8fDB8fHww',
    },
    {
      'title': 'Item 5',
      'description': 'Description of Item 5',
      'imageUrl': 'https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmVjaXBlfGVufDB8fDB8fHww',
    },
    {
      'title': 'Item 6',
      'description': 'Description of Item 6',
      'imageUrl': 'https://images.pexels.com/photos/1109197/pexels-photo-1109197.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'title': 'Item 7',
      'description': 'Description of Item 7',
      'imageUrl': 'https://images.pexels.com/photos/4144234/pexels-photo-4144234.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'title': 'Item 8',
      'description': 'Description of Item 8',
      'imageUrl': 'https://images.pexels.com/photos/4198375/pexels-photo-4198375.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'title': 'Item 9',
      'description': 'Description of Item 9',
      'imageUrl': 'https://images.pexels.com/photos/1109197/pexels-photo-1109197.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'title': 'Item 10',
      'description': 'Description of Item 10',
      'imageUrl': 'https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmVjaXBlfGVufDB8fDB8fHww',
    },
  ];
 
  final ScrollController _scrollController = ScrollController();
 
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(packageViewModelProvider);
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          // Scroll garda feri last ma ho ki haina bhanera check garne ani data call garne
          if (_scrollController.position.extentAfter == 0) {
            // Data fetch gara api bata
            // ref.read(packageViewModelProvider.notifier).getPackages();
          }
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.yellow[400],
          title: const Text('recipe food'),
          actions: [
            TextButton.icon(
              onPressed: () {
                // ref.read(packageViewModelProvider.notifier).resetState();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
          ],
        ),
        body: RefreshIndicator(
          // Yo chai pull to refresh ko lagi ho
          color: Colors.green,
          backgroundColor: Colors.amberAccent,
          onRefresh: () async {
            // ref.read(packageViewModelProvider.notifier).resetState();
          },
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  controller: _scrollController,
                  itemCount: items.length,
                  // physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: item['imageUrl']!,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      title: Text(item['title']!),
                      subtitle: Text(item['description']!),
                    );
                  },
                ),
              ),
              // Data load huda feri progress bar dekhaune natra banda garne
              // if (state.isLoading)
              //   const CircularProgressIndicator(color: Colors.red),
 
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}