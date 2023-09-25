import 'package:contact_app/data/contact.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as faker;

var CONTACTS;

class ContactListPage extends StatefulWidget {
  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  //underscore acts like a private access modifier
  List<Contact> _contacts = List.generate(60, (index) {
    return Contact(
        name: faker.Person(faker.RandomGenerator()).firstName() +
            ' ' +
            faker.Person(faker.RandomGenerator()).lastName(),
        email: faker.Internet(faker.RandomGenerator()).freeEmail(),
        phoneNumber: faker.RandomGenerator().integer(1000).toString());
  });

  //Runs when widget is initialized
  @override
  void initState() {
    super.initState();
    _contacts = List.generate(60, (index) {
      return Contact(
          name: faker.Person(faker.RandomGenerator()).firstName() +
              ' ' +
              faker.Person(faker.RandomGenerator()).lastName(),
          email: faker.Internet(faker.RandomGenerator()).freeEmail(),
          phoneNumber: faker.RandomGenerator().integer(1000).toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 197, 30, 30),
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        //this runs & builds every list item
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_contacts[index].name),
            subtitle: Text(_contacts[index].email),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _contacts[index].isFavourite = !_contacts[index].isFavourite;
                _contacts.sort;{(a,b) {
    if (a.isFavourite) {
      return -1;
    } else if (b.isFavourite) {
      return 1;
    } else {
      return 0;
    }
  };
}
                });
              },
              icon: Icon(
                _contacts[index].isFavourite ? Icons.star : Icons.star_border,
                color: _contacts[index].isFavourite
                    ? Colors.amber
                    : Colors.black38,
              ),
            ),
          );
        },
      ),
    );
  }
}
