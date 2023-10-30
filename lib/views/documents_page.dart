import 'package:flutter/material.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPage();
}

class _DocumentsPage  extends State<DocumentsPage> {

  final List<Map<String,dynamic>> _documents = [ //TODO: REMOVE AFTER GETTING IT FROM BACKEND
    {'id': 1, 'name': 'Condominio Janeiro' , 'type': 'Fatura', 'Upload': '10:25 11/01/2023'},
    {'id': 2, 'name': 'Condominio Fevereiro' , 'type': 'Fatura', 'Upload': '10:25 11/01/2023'},
    {'id': 3, 'name': 'Condominio Marco' , 'type': 'Fatura', 'Upload': '10:25 11/01/2023'},
    {'id': 4, 'name': 'Condominio Abril' , 'type': 'Fatura', 'Upload': '10:25 11/01/2023'},
    {'id': 5, 'name': 'Condominio Maio' , 'type': 'Fatura', 'Upload': '10:25 11/01/2023'},
    {'id': 6, 'name': 'Pintura Escadas' , 'type': 'Fatura', 'Upload': '10:25 11/01/2023'},
    {'id': 7, 'name': 'Condominio Julho' , 'type': 'Fatura', 'Upload': '10:25 11/01/2023'},
    {'id': 8, 'name': 'Condominio Julho' , 'type': 'Fatura', 'Upload': '10:25 11/01/2023'},
    {'id': 9, 'name': 'Assembleia Geral Janeiro' , 'type': 'Ata', 'Upload': '10:25 11/01/2023'}
  ];

  List<Map<String,dynamic>> _filteredDocuments = [];

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: CALL BACKEND SERVICE AND POPULATE LISTS
    _filteredDocuments = _documents;
    super.initState();
  }

  void _runFilter(String keyword) {
    List<Map<String,dynamic>> results = [];

    if(keyword.isEmpty) {
      results = _documents;
    } else {
      results = _documents.where((document) =>
          document["name"]
              .toLowerCase()
              .toString()
              .contains(keyword.toLowerCase()))
          .toList();
    }

    setState(() { _filteredDocuments = results; });
  }

  void _runClear() {
    _controller.clear();
    setState(() { _filteredDocuments = _documents; });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(width: 0.8),
                  ),
                  hintText: 'Procurar',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => _runClear(),
                  )
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: _filteredDocuments.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_filteredDocuments[index]['id']),
                  color: Colors.grey,
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.download),
                    title: Text(
                      'Nome: ${_filteredDocuments[index]['name'].toString()}',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      ),
                    ),
                    subtitle: Text(
                      'Tipo: ${_filteredDocuments[index]['type'].toString()}',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      ),
                    ),
                    ),
                  ),
                ),
            ),
          ],
        ),
      )
      );
  }

}