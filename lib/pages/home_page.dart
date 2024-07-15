import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kidlat/main.dart';
import 'package:kidlat/pages/profile_page.dart';
import 'package:location/location.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MapSample(),
    Text('Activity Page'),
    Text('Option 3'),
    Text('Favorites Page'),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(254, 182, 44, 1),
            borderRadius: BorderRadius.circular(1.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200.0),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Map',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.note),
                  label: 'Activity',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_activity),
                  label: 'Kidlat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              backgroundColor: const Color.fromRGBO(254, 182, 44, 1),
              selectedIconTheme: const IconThemeData(color: Colors.white),
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(color: Colors.white),
              unselectedLabelStyle: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  LocationData? _currentLocation;
  final Location _locationService = Location();
  Set<Marker> _markers = {};
  List<String> _suggestions = [];
  TextEditingController _searchController = TextEditingController();
  OverlayEntry? _overlayEntry;
  final FocusNode _focusNode = FocusNode();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(14.558231435712608, 121.0173471405225),
    zoom: 14.4746,
  );

  void _addMarker(LatLng position, String markerId, String title, String snippet) {
    Marker marker = Marker(
      markerId: MarkerId(markerId),
      position: position,
      infoWindow: InfoWindow(
        title: title,
        snippet: snippet,
      ),
    );

    setState(() {
      _markers.add(marker);
      _updateSuggestions();
    });
  }

  void _addAdditionalMarkers() {
    _addMarker(LatLng(14.554729, 121.024445), 'marker2', 'Marker 2', 'Second marker');
    _addMarker(LatLng(14.561212, 121.015305), 'marker3', 'Marker 3', 'Third marker');
    _addMarker(LatLng(14.557745, 121.018705), 'marker4', 'Marker 4', 'Fourth marker');
  }

  void _updateSuggestions() {
    setState(() {
      _suggestions = _markers.map((marker) => marker.infoWindow.title ?? '').toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _addAdditionalMarkers();
    _getCurrentLocation();
    _searchController.addListener(() {
      _updateOverlay();
    });
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    _removeOverlay();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    final LocationData location = await _locationService.getLocation();
    setState(() {
      _currentLocation = location;
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(location.latitude!, location.longitude!),
        zoom: 14.4746,
      ),
    ));
  }

  Future<void> _centerMapOnMarker(String title) async {
    final GoogleMapController controller = await _controller.future;
    Marker? marker;

    try {
      marker = _markers.firstWhere((m) => m.infoWindow.title!.toLowerCase() == title.toLowerCase());
    } catch (e) {
      marker = null;
    }

    if (marker != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: marker.position,
            zoom: 14.4746,
          ),
        ),
      );
    } else {
      print("Marker named $title not found");
    }
  }

  void _updateOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    final filteredSuggestions = _suggestions
        .where((suggestion) =>
            suggestion.toLowerCase().contains(_searchController.text.toLowerCase()))
        .toList();
    if (_searchController.text.isNotEmpty && filteredSuggestions.isNotEmpty) {
      _overlayEntry = _createOverlayEntry(filteredSuggestions);
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry = null;
    }
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry(List<String> suggestions) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width - 25,
        left: offset.dx + 10,
        top: offset.dy + 125,
        child: Material(
          elevation: 4.0,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(suggestions[index]),
                onTap: () {
                  _centerMapOnMarker(suggestions[index]);
                  _searchController.text = suggestions[index];
                  FocusScope.of(context).unfocus(); // Close the keyboard
                  _removeOverlay(); // Remove the overlay after selection
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal, // Set the map to 2D mode
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                if (_currentLocation != null) {
                  controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                      zoom: 14.4746,
                    ),
                  ));
                }
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: _markers,
            ),
            Positioned(
              top: 20, // Adjust this value for more padding if necessary
              left: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  ),
                  onSubmitted: (value) {
                    _centerMapOnMarker(value);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
