import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:funda_assignment/models/property_feed_model.dart';
import 'package:funda_assignment/repositories/property_feed.dart';
import 'package:funda_assignment/views/property.dart';
import 'package:provider/provider.dart';

class PropertyList extends StatelessWidget {
  final PropertyFeedModel feed;
  PropertyList({required this.feed});

  @override
  Widget build(BuildContext context) {
    List<Object> properties = feed.objects;

    ///TODO: implement paging when scrolling to the bottom

    return ListView.separated(
      itemBuilder: (context, index) {
        Object property = properties[index];
        return Hero(
          tag: property.fotoLarge,
          child: InkWell(
            onTap: () {
              ///Fetch property details and then navigate to property page
              Provider.of<PropertyFeedRepo>(context, listen: false).fetchProperty(id: property.id.toString());
              Navigator.push(context, CupertinoPageRoute(builder: (_) => Property(property: property)));
            },
            child: Stack(children: [
              ///image with text overlayed
              Container(child: Image(image: NetworkImage(property.fotoLarge))),
              Positioned(
                bottom: 10,
                right: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '€ ${property.koopprijsTot.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      '${property.aantalKamers} Rooms',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      '${property.woonOppervlakteTot} m\u00B2',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  property.adres,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ]),
          ),
        );
      },
      ///basic seperator
      separatorBuilder: (context, index) => Container(
        height: 4,
        color: Colors.white,
      ),
      itemCount: properties.length,
    );
  }
}
