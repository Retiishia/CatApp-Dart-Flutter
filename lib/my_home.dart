import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/detail.dart';
import 'package:untitled/network/api_service.dart';

import 'network/response/cat_response.dart';

class MyHome extends StatefulWidget {

  CatPage createState() => CatPage();


}

class CatPage extends State<MyHome>{
  Icon searchIcon = const Icon(Icons.search);
  Widget header = const Text("Cat Search");
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  late List<CatSearchResponse> _searchResult;
  late bool _isSearching;
  String _inputText = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: header,
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                if(searchIcon.icon == Icons.search){
                  searchIcon = const Icon(Icons.clear);
                  header = ListTile(
                    leading: const Icon(
                        Icons.search),
                    iconColor: Colors.white,
                    title : TextField(
                      controller: _searchQuery,
                      decoration : const InputDecoration(
                        hintText : 'Masukkan nama kucing',
                        hintStyle : TextStyle(
                          color : Colors.white,
                          fontSize : 18,
                          fontStyle : FontStyle.italic,
                        ),
                    border : InputBorder.none,
                  ),
                style : const TextStyle(
                color: Colors.white,
                ),
                  )

                  );
                  _handleSearchStart();
                }
                else {
                  _handleSearchEnd();
                }
              });
            },
            icon: searchIcon,
          )
        ],
      ),
      body: _listCat(context),
    );
  }

  CatPage(){
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty){
        setState(() {
          _isSearching = false;
          _inputText = "";
        });
      }
      else{
        setState(() {
          _isSearching = true;
          _inputText = _searchQuery.text;
        });
      }
    });
  }

  void _handleSearchStart(){
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd(){
    setState(() {
      _isSearching = false;
      _searchQuery.clear();
      header = const Text("Cat Search");
      searchIcon = const Icon(Icons.search);
    });
  }

  FutureBuilder _listCat(BuildContext context){
    return FutureBuilder<List<CatSearchResponse>>(
      future: Provider.of<ApiService>(context, listen: false).getData(_searchQuery.text),
      builder: (BuildContext context, AsyncSnapshot<List<CatSearchResponse>> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Container(
              child: const Center(
                child: Text("Error"),
              ),
            );
          }
          final dataCat = snapshot.data!;
          return _listCats(context : context, dataCat : dataCat);

        } else {
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  ListView _listCats({BuildContext? context, List<CatSearchResponse>? dataCat}){
    return ListView.builder(
        itemCount: dataCat?.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: const EdgeInsets.all(6.0),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(dataCat![index].name[0],
                    style: const TextStyle(fontSize: 30),),
                ),
                title: Text(dataCat[index].name, style: const TextStyle(fontSize: 22),),
                subtitle: Text(dataCat[index].alt_names),
                onTap: () => {
                  getItemAndNavigate(context)
                },
              ),
            ),
          );
        }); //"Nama Lain : ${dataCat[index].alt_names}"
  }

  getItemAndNavigate(BuildContext context){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Detail())
    );
  }
}