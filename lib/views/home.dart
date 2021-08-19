import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funda_assignment/repositories/property_feed.dart';
import 'package:funda_assignment/views/error.dart';
import 'package:funda_assignment/views/property_list.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PropertyFeedRepo propertyFeedRepo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PropertyFeedRepo>(context, listen: false).fetchFeed();
  }

  @override
  Widget build(BuildContext context) {
    final PropertyFeedRepo propertyFeedRepo = context.watch<PropertyFeedRepo>();
    return Scaffold(
      appBar: AppBar(
        title: Container(
            width: 100,
            height: 45,
            child: SvgPicture.asset(
              'assets/fundawonen-logo.svg',
            )),
      ),
      body: Center(child: _getBody(propertyFeedRepo: propertyFeedRepo)),
    );
  }

  Widget _getBody({required PropertyFeedRepo propertyFeedRepo}) {
    ///Feed is still loading, show progress indicator
    if (propertyFeedRepo.loading)
      return CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      );

    ///Feed finished loading, but has no data, display error
    if (propertyFeedRepo.hasData == false) return Error(message: 'Something went wrong, yikes. Please try again.');

    ///Feed has returned, show all listings
    return PropertyList(
      feed: propertyFeedRepo.feed,
    );
  }
}
