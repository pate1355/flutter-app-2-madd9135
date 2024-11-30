import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  DataPageState createState() => DataPageState();
}

class DataPageState extends State<DataPage> {
  Future<List<Model>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      print(response.body);
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item) => Model.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Page')),
      body: FutureBuilder<List<Model>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return ListTile(
                  title: Text(item.name!),
                  subtitle: Text(item.email!),
                  //arrow
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(title: Text(item.name!)),
                          body: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header Section
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'User Details',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                                const Divider(thickness: 1.5),

                                // User Information Section
                                ListTile(
                                  leading: const Icon(Icons.person,
                                      color: Colors.blueAccent),
                                  title: const Text(
                                    'Username:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text("${item.username}"),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.email,
                                      color: Colors.redAccent),
                                  title: const Text(
                                    'Email:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text("${item.email}"),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.phone,
                                      color: Colors.green),
                                  title: const Text(
                                    'Phone:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text("${item.phone}"),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.language,
                                      color: Colors.teal),
                                  title: const Text(
                                    'Website:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text("${item.website}"),
                                ),
                                const Divider(thickness: 1.5),

                                // Address Section
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'Address',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.home,
                                      color: Colors.purple),
                                  title: Text(
                                      '${item.address!.street}, ${item.address!.suite}'),
                                  subtitle: Text(
                                      '${item.address!.city} - ${item.address!.zipcode}'),
                                ),
                                const Divider(thickness: 1.5),

                                // Company Section
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'Company',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.business,
                                      color: Colors.orange),
                                  title: Text("${item.company!.name}"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
