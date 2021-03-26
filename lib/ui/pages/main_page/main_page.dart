import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:web_store/store/app_state/app_state.dart';
import 'package:web_store/ui/layouts/main_layout.dart';
import 'package:web_store/ui/pages/main_page/main_page_vm.dart';
import 'package:web_store/ui/pages/main_page/widgets/categories_widget.dart';
import 'package:web_store/ui/pages/main_page/widgets/filter_widget.dart';
import 'package:web_store/ui/pages/main_page/widgets/items_list_widget.dart';
import 'package:web_store/ui/pages/main_page/widgets/search_field_widget.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageVM>(
      converter: (store) => MainPageVM.fromStore(store),
      builder: (ctx, vm) {
        return MainLayout(
          //todo add main dictionary to vm
          child: Column(
            children: [
              // SearchFieldWidget(vm: vm,),
              Row(
                children: [
                  CategoriesWidget(),
                  FilterWidget(),
                ],
              ),
              ItemsListWidget(vm: vm),
            ],
          ),
        );
      },
    );
  }
}

/*
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:web_store/retrofit/api_client.dart';



class MyApp extends StatelessWidget {
// to set the root of app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'API Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Flutter - Retrofit Implementation"),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Icon(Icons.cancel),
        backgroundColor: Colors.green,
      ),
    );
  }

  // build list view & manage states
 FutureBuilder<ResponseData> _buildBody(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<ResponseData>(
      future: client.getUsers(),
      builder: (context, snapshot) {
        if (snapshot == null) {
          print('snapshot NULL');
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot?.connectionState == ConnectionState.done) {
            print('snapshot= $snapshot');
            final ResponseData posts = snapshot.data;
            print('posts = $posts');
            return _buildListView(context, posts);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      },
    );
  }

  // build list view & its tile
  Widget _buildListView(BuildContext context, ResponseData posts) {
    if (posts == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.account_box,
                color: Colors.green,
                size: 50,
              ),
              title: Text(
                posts.data[index]['name'],
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(posts.data[index]['email']),
            ),
          );
        },
        itemCount: posts.data.length,
      );
    }
  }
}*/
