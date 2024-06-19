import 'package:contact_app/contact_model.dart';
import 'package:contact_app/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cName = TextEditingController();
  TextEditingController cNumber = TextEditingController();

  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    context.read<ContactProvider>().loadTodos();
  }

//  final Uri _url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    contacts = context.watch<ContactProvider>().contactList;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Page'),
        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.person),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => _makePhoneCall(contacts[index].number!),
                    icon: const Icon(Icons.call),
                  ),
                  IconButton(
                    onPressed: () {
                      updateContact(context, contacts[index]);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      // todos.remove(todos[index]);
                      context
                          .read<ContactProvider>()
                          .deleteTodo(contacts[index]);
                      // todoProvider.loadTodos();
                      // setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "Delete todo successfully",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
              // void onTap: updateContact(),
              // trailing: const Icon(Icons.edit),
              title: Text(contacts[index].name!),
              subtitle: Text(contacts[index].number.toString()),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              addDialog(context);
            },
            child: const Icon(Icons.add)));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<dynamic> updateContact(BuildContext context, Contact contact) {
    cName.text = contact.name!;
    cNumber.text = contact.number!;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Contact"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: cName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: cNumber,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  var newTodo = Contact(name: cName.text, number: cNumber.text);
                  // todos.add(todo);
                  context.read<ContactProvider>().updateTodo(contact, newTodo);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green[900],
                      content: const Text(
                        "Todo added successfully",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Update')),
          ],
        );
      },
    );
  }

  Future<dynamic> addDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Name"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: cName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: cNumber,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () async {
                  var todo = Contact(name: cName.text, number: cNumber.text);
                  context.read<ContactProvider>().addTodo(todo);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green[900],
                      content: const Text(
                        "Contact added successfully",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Add')),
          ],
        );
      },
    );
  }
}
