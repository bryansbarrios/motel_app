import 'package:flutter/material.dart';
import 'package:motel_app/ui/widgets/Tag.dart';

class MotelCard extends StatelessWidget {

  final String motelName;
  final String type;
  final String city;
  final String price;
  final String rating;
  final String photo;

  MotelCard({this.motelName, this.type, this.city, this.price, this.rating, this.photo});

  final first = TextStyle(
    fontSize: 18,
    color: Colors.blueGrey,
    fontWeight: FontWeight.w600,
  );

  final second = TextStyle(
    fontSize: 16,
    color: Colors.blueGrey,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/loading.gif'),
                    image: NetworkImage(photo,),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Tag(tag: type,),
                  top: 10,
                  left: 10,
                )
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("  $motelName", style: first),
              Container(
                child: Row(
                  children: <Widget>[
                    LimitedBox(
                      maxHeight: 16,
                      maxWidth: double.infinity,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Star_rating_5_of_5.png/799px-Star_rating_5_of_5.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("$rating  ", style: first)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("  $city", style: second),
              Text("$price  ", style: second),
            ],
          ),
        ],
      ),
    );
  }
}