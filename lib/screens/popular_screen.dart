import 'package:flutter/material.dart';
import 'package:tap_2/models/popular_model.dart';
import 'package:tap_2/network/api_popular.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State <PopularScreen> createState() =>  PopularScreenState();
}

class  PopularScreenState extends State <PopularScreen> {

  ApiPopular apiPopular = ApiPopular();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Popular Movies'),
      ),
      body: FutureBuilder(
        future: apiPopular.getAllPopular(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7
                ), 
              itemBuilder:(context, index) {
                return PopularItem(snapshot.data![index]);
                
              }, 
            );
          }else{
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
  Widget PopularItem(PopularModel popular){
    return InkWell(
      onTap: (){Navigator.pushNamed(context, '/detail', arguments: popular);
      },
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://image.tmdb.org/t/p/w500/${popular.posterPath}'),
        )
      ),
    ),
  );
  }
}
