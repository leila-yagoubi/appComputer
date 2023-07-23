import 'package:flutter/material.dart';

import 'api.dart';

class test extends StatefulWidget {
   test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
   List<DataModel> dataList = [];
     final TextEditingController nameController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Datasevices dataService = Datasevices();

    // Get data from the Laravel API
    List<DataModel> fetchedData = await dataService.get();
    setState(() {
      dataList = fetchedData;
    });
  }

    void postData() async {
    Datasevices dataService = Datasevices();

    // Post data to the Laravel API
    Map<String, dynamic> data = {
      'name': nameController.text,
      'prenom': prenomController.text,
      'description': descriptionController.text,
    };

    Map<String, dynamic> response = await dataService.post(data);
    print('Response from server: $response');

    // After posting, fetch updated data from the API
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: dataList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      DataModel data = dataList[index];
                      return ListTile(
                        title: Text(data.name),
                        subtitle: Text(data.prenom),
                        // Add more fields as required
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: prenomController,
                  decoration: InputDecoration(labelText: 'Prenom'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                ElevatedButton(
                  onPressed: postData,
                  child: Text('Post Data'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
