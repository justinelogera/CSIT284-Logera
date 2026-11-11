import 'dart:convert';
 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
 
class NewItem extends StatefulWidget{
  const NewItem({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}
 
class _NewItemState extends State<NewItem>{
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var selectedCategory = categories[Categories.vegetables];
 
  void _saveItem() async{
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
 
      final url = Uri.https(
        'flotter-apps-default-rtdb.asia-southeast1.firebasedatabase.app',
        'shopping-list.json'
      );
 
      final response = await http.post(
        url,
        headers: {'Content-Type' : 'application/json'},
        body: json.encode({
          'name': _enteredName,
          'quantity': _enteredQuantity,
          'category': selectedCategory!.title,
        })
      );
        final Map<String, dynamic> resData = json.decode(response.body);
      Navigator.of( context).pop(
        GroceryItem(
          id: resData ['name'],
          name: _enteredName,
          quantity: _enteredQuantity,
          category: selectedCategory!,
        )
      );
    }
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new item'),
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
        children: [
          TextFormField(
            maxLength: 50,
            decoration: InputDecoration(
              label: const Text('Name'),
            ),
            onSaved: (value) {
              _enteredName = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().length <= 1) {
                return 'Name must not be empty';
              }
              return null;
            },
          ),
 
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: const Text('Quantity'),
                  ),
                  initialValue: _enteredQuantity.toString(),
                  onSaved: (value) {
                    _enteredQuantity = int.parse(value!);
                  },
                  validator: (value) {
                    if (value == null ||
                        int.tryParse(value) == null ||
                        int.parse(value) <= 0) {
                      return 'Input must be number';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField(
                  initialValue: selectedCategory,
                  value: selectedCategory,
                  items: [
                    for (final category in categories.values)
                      DropdownMenuItem(
                        value: category,
                        child: Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              color: category.color,
                            ),
                            const SizedBox(width: 6),
                            Text(category.title),
                          ],
                        ),
                      ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  _formKey.currentState!.reset();
                },
                child: const Text('Reset'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _saveItem,
                child: const Text('Add Item'),
              ),
            ],
          ),
        ],
      ),
      ),
       
    ),
    );
  }
}