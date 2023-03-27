import 'package:flutter/material.dart';
import 'package:tcckau/models/User.dart';

class Search extends StatefulWidget {
  Search({ required Key key }) : super(key: key);
  @override
  _SearchState createState() => new _SearchState();

}

class _SearchState extends State<Search>
{
  Widget appBarTitle =  const Text("Search Sample", style:  TextStyle(color: Colors.white),);
  Icon actionIcon =  const Icon(Icons.search, color: Colors.white,);
  final key =  GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery =  TextEditingController();
  final List<String> _list = [];
  bool _isSearching = false;
  String _searchText = "";

 _SearchState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      }
      else {
        setState(() {
          _isSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    init();

  }

  void init() {
    List<UserData> _list = [];
    _list.add(UserData(name:  ''));
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(color: Colors.red),
      ),//buildBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: _isSearching ? _buildSearchUser() : _buildList(),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchUser() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => ChildItem(contact))
          .toList();
    }
    else {
      List<String> _searchList = List.empty();
      for (int i = 0; i < _list.length; i++) {
        String  name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => ChildItem(contact))
          .toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return  AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
           IconButton(icon: actionIcon, onPressed: () {
            setState(() {
              if (actionIcon.icon == Icons.search) {
                actionIcon =  const Icon(Icons.close, color: Colors.white,);
                appBarTitle =  TextField(
                  controller: _searchQuery,
                  style:  const TextStyle(
                    color: Colors.white,

                  ),
                  decoration:  const InputDecoration(
                      prefixIcon:  Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle:  TextStyle(color: Colors.white)
                  ),
                );
                _handleSearchStart();
              }
              else {
                _handleSearchEnd();
              }
            });
          },),
        ]
    );
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      actionIcon = const Icon(Icons.search, color: Colors.white,);
      appBarTitle =
      const Text("Search Sample", style: TextStyle(color: Colors.white),);
      _isSearching = false;
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