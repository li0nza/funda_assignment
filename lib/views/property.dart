import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funda_assignment/models/property_model.dart';
import 'package:funda_assignment/models/property_feed_model.dart';
import 'package:funda_assignment/repositories/property_feed.dart';
import 'package:funda_assignment/views/error.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Property extends StatefulWidget {
  final Object property;

  Property({required this.property});

  @override
  _PropertyState createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  late GoogleMapController mapController;
  VideoPlayerController? _controller;
  bool _hasInitVideo = false;
  int _maxLines = 5;

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
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
      body: _getBody(context, loading: propertyFeedRepo.loading, repo: propertyFeedRepo),
    );
  }

  Widget _getBody(context, {required bool loading, required PropertyFeedRepo repo}) {
    /// if still loading show info from feed, and loader
    if (loading) {
      return Column(
        children: [
          Stack(children: [
            Container(child: Image(image: NetworkImage(widget.property.fotoLarge))),
            Positioned(
              bottom: 10,
              right: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '€ ${widget.property.koopprijsTot.toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    '${widget.property.aantalKamers} Rooms',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    '${widget.property.woonOppervlakteTot} m\u00B2',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                widget.property.adres,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ]),
          Container(
              padding: EdgeInsets.only(top: 100),
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ))
        ],
      );
    }

    /// if property is null, something went wrong
    /// TODO: implement retry button, and make this prettier
    if (repo.property == null) return Error(message: 'Something went wrong, yikes. Please try again.');

    ///get property details from repository
    PropertyModel propDetails = repo.property!;

    /// if video has not yet been initialized, do so now. Not a good way of doing it, but we are loading the data
    /// after coming to the page
    if (_hasInitVideo == false) {
      _controller = VideoPlayerController.network(propDetails.video.videos.last.url)
        ..initialize().then((_) {
          _hasInitVideo = true;
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
    }
    return ListView(
      children: [
        Stack(children: [
          ///Image carousel, pretty self explanatory
          CarouselSlider.builder(
              itemCount: repo.images.length,
              itemBuilder: (context, itemIndex, pageViewIndex) {
                return Image.network(repo.images[itemIndex] ?? '');
              },
              options: CarouselOptions(
                height: 285,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              )),

          ///info positioned bottom right of carousel
          Positioned(
            bottom: 10,
            right: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '€ ${widget.property.koopprijsTot.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  '${widget.property.aantalKamers} Rooms',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  '${widget.property.woonOppervlakteTot} m\u00B2',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),

          ///info positioned bottom left of carousel
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              widget.property.adres,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ]),
        Container(
          padding: EdgeInsets.only(top: 12, bottom: 4, left: 8),
          child: Text(
            'Description',
            style: TextStyle(fontSize: 22, color: Theme.of(context).accentColor),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            propDetails.volledigeOmschrijving,
            maxLines: _maxLines,
            style: TextStyle(fontSize: 14),
          ),
        ),

        ///button to expand/collapse description
        TextButton(
            child: Text(
              _maxLines == 5 ? 'Show more' : 'Show less',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            onPressed: () {
              setState(() {
                if (_maxLines == 5) {
                  _maxLines = 100;
                } else {
                  _maxLines = 5;
                }
              });
            }),
        Container(
          height: 300,
          child: GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition: CameraPosition(
              target: LatLng(propDetails.wgs84Y, propDetails.wgs84X),
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('asdf'),
                position: LatLng(propDetails.wgs84Y, propDetails.wgs84X),
              )
            },
          ),
        ),

        ///if video has been loaded, show it
        _controller!.value.isInitialized
            ? InkWell(
                onTap: () {
                  setState(() {
                    _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
                  });
                },
                child: Stack(children: [
                  AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
                  if (_controller!.value.isPlaying == false)
                    AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: Container(
                        child: Icon(
                          Icons.play_arrow,
                          color: Theme.of(context).primaryColor,
                          size: 100,
                        ),
                      ),
                    ),
                ]),
              )
            : Container(),
      ],
    );
  }
}
