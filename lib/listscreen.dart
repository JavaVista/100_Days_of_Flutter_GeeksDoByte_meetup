import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  List<String> ideas = [];

  @override
  void initState() {
    super.initState();
    loadIdeas();
  }

  void loadIdeas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      ideas = (prefs.getStringList('ideas') ?? []);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadIdeas();
  }

  void updateIdeas(updatedIdeas) {
    setState(() {
      ideas = updatedIdeas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('List Screen')),
        body: ListView(
          children: [
            for (var idea in ideas)
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(idea),
              ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final updatedIdeas = await Navigator.pushNamed(context, '/input');
            if (updatedIdeas != null) {
              updateIdeas(updatedIdeas);
            }
          },
          child: const Icon(Icons.add),
        ));
  }
}
