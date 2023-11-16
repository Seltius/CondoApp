import 'package:condo_app/views/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import '../controllers/document_controller.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<StatefulWidget> createState() => _DocumentsPageState();

}

class _DocumentsPageState extends State<DocumentsPage> {
  DocumentController documentController = DocumentController();
  List<Map<String, dynamic>> documents = [];
  String _searchQuery = '';
  String _selectedDocumentTypeFilter = '';
  DateTime? _selectedDateFilter;

  @override
  void initState() {
    super.initState();
    _loadDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Procurar',
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton(
                        icon: const Icon(Icons.filter_list_alt),
                        isExpanded: false,
                        underline: Container(color: Colors.transparent),
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'INVOICE',
                            child: Text('Faturas'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'MINUTES',
                            child: Text('Minutas'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'BUDGET',
                            child: Text('Orçamentos'),
                          ),
                          DropdownMenuItem<String>(
                            value: '',
                            child: Text('Todos'),
                          )
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            _selectedDocumentTypeFilter = value!;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredDocuments.length,
              itemBuilder: (context, index) {
                final document = filteredDocuments[index];
                return GestureDetector(
                  onTap: () async {
                    final file = await documentController.getDocument(document['id']);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewerScreen(document: file)));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(document['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tipo: ${_documentTypeToText(document['type'])}'),
                          Text('Autor: ${document['uploader']}'),
                          Text('Data: ${document['uploadDate']}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadDocuments() async {
    try {
      final fetchedDocuments = await documentController.getDocuments();
      setState(() {
        documents = fetchedDocuments;
      });
    } catch (e) {
      // TODO Handle error (show a snackbar, display an error message)
    }
  }

  String _documentTypeToText(String type) {
    switch (type) {
      case 'MINUTES':
        return 'Minuta';
      case 'BUDGET':
        return 'Orçamento';
      case 'INVOICE':
        return 'Fatura';
      default:
        return 'Desconhecido';
    }
  }

  List<Map<String, dynamic>> get filteredDocuments {
    // Apply filters to the list of documents
    return documents.where((document) {
      final nameMatches = document['name'].toLowerCase().contains(_searchQuery.toLowerCase());
      final typeMatches = _selectedDocumentTypeFilter.isEmpty ||
          document['type'] == _selectedDocumentTypeFilter;
      final dateMatches = _selectedDateFilter == null ||
          document['uploadDate'].isAfter(_selectedDateFilter!);
      return nameMatches && typeMatches && dateMatches;
    }).toList();
  }

}