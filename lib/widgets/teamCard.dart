//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:tcckau/models/Search.dart';
//import 'package:tcckau/models/team_data.dart';
//import 'package:tcckau/widgets/user_image_picker.dart';
import 'package:tcckau/models/User.dart';

class TeamCard extends StatefulWidget {
  const TeamCard({super.key});

  //const TeamCard({ Key? key }) : super(key: key);
  //final TeamData _teamData = TeamData();

  // void _handlePickedImage(File image) {
  //   _teamData.image = image;
  // }

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  Widget appBarTitle = const Text(
    "Search Sample",
    style: const TextStyle(color: Colors.white),
  );
  Icon actionIcon = const Icon(
    Icons.search,
    color: Colors.white,
  );
  final SearchData _searchData = SearchData();
  final TextEditingController _searchQuery = TextEditingController();
  List<String> _list = [];
  bool _IsSearching = false;
  String _searchText = "";

  _SearchState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  void init() {
    List<UserData> _list = [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(40, 40, 40, 1),
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: _searchQuery,
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(30, 30, 30, 1),
                    filled: true,
                    hintText: 'Digite um nome para a equipe',
                    labelText: 'Nome',
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //                 onChanged: (value) => _name['name'] = _searchQuery.text,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(30, 30, 30, 1),
                    filled: true,
                    hintText: 'Cole a URL ou escolha uma imagem',
                    labelText: 'Imagem',
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) => {},
                ),
                const SizedBox(height: 14),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(30, 30, 30, 1),
                    filled: true,
                    hintText: 'Pesquisar usuários',
                    labelText: 'Membros',
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    //=> _name['name'] = _controllerSearch.text
                    return;
                    // ListView(
                    //           padding: EdgeInsets.symmetric(vertical: 8.0),
                    //           children: _IsSearching ? _buildSearchUser() : _buildList(),
                    //    );
                  },
                ),
                const SizedBox(height: 150),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(
                      left: 95,
                      right: 95,
                      top: 15,
                      bottom: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    textStyle: const TextStyle(fontSize: 15),
                    backgroundColor: Colors.yellowAccent,
                  ),
                  child: const Text(
                    'Sortear equipe',
                    style: TextStyle(
                      color: Color.fromRGBO(45, 45, 45, 1),
                    ),
                  ),
                  onPressed: () => {},
                ),
                const SizedBox(height: 15),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(
                      left: 82,
                      right: 82,
                      top: 15,
                      bottom: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    textStyle: const TextStyle(fontSize: 15),
                    backgroundColor: const Color.fromRGBO(0, 170, 255, 5),
                  ),
                  child: const Text(
                    'Convidar membros',
                    style: TextStyle(
                      color: Color.fromRGBO(45, 45, 45, 1),
                    ),
                  ),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchUser() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => ChildItem(contact)).toList();
    } else {
      List<String> _searchList = [];
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => ChildItem(contact)).toList();
    }
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      actionIcon = const Icon(
        Icons.search,
        color: Colors.white,
      );
      appBarTitle = const Text(
        "Search Sample",
        style: TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final String name;
  const ChildItem(this.name, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(name));
  }
}
