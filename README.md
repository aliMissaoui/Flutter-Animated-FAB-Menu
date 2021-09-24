<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Animated FAB Menu
**Animated FAB Menu** package lets you add an animated floating action button to your Flutter app that open a list of menu items.


## Features
The FabMenu widget is built to be placed in the `Scaffold.floatingActionButton` argument, replacing the `FloatingActionButton` widget. Its position is set by the `fabAlignment` property so you don't need to set it with the `Scaffold.floatingActionButtonLocation` argument. By default the position is set to `bottomCenter`, but you can change it by the `fabAlignment` property to place the button anywhere in the screen. By using the `fabIcon` and `fabBackgroundColor`properties, you can change the icon and the color of the button to whatever you like. 

* *Menu*

By pressing the floating action button, a page containing a **menu** list will be opening with some cool animation. This **menu** contains items that you can specify by the `children` list property. Every child inside the list takes a `title` for the item name, `style` for the text widget of the name, `onTap` function to provide the logic of the on tap action on each child. On top of that, you have an `overlayColor` property to change the color of the background opened page, `overlayOpacity` to change the opacity of the background color and `closeMenuButton` to choose your own back button widget.

*The package will handle the animation by itself.*

![animated_fab_menu](https://user-images.githubusercontent.com/68671238/134653636-1e0f070c-588a-4189-aa7f-45e9957ccae9.png)
  
<hr>

## Getting started

1. Add the latest version of package to your `pubspec.yaml` (and run `dart pub get`):
```dart
dependencies:
  animated_fab_button_menu: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:animated_fab_button_menu/animated_fab_button_menu.dart';
```
<hr>

## Usage

There are a number of properties that you can modify:

* fabIcon
* fabBackgroundColor
* fabAlignment
* overlayColor (Color of the background menu)
* overlayOpacity (Opacity of the background menu color)
* elevation
* closeMenuButton (Button that close the menu item)
* children (Items of the menu)
* title (Name of the child menu) 
* style (Text style for the child menu)
* onTap (onTap function for the child menu)

**Example Usage ( complete with all params ):**
<table>
 <tr>
 <td>
      
```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabMenu(
          fabBackgroundColor: Colors.amber,
          elevation: 2.0,
          fabAlignment: Alignment.bottomCenter,
          fabIcon: const Icon(Icons.more_horiz),
          closeMenuButton: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          overlayOpacity: 0.5,
          overlayColor: Colors.amber,
          children: [
            MenuItem(
              title: 'Home',
              onTap: () {},
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            MenuItem(
              title: 'Profile',
              onTap: () {},
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            MenuItem(
              title: 'Messages',
              onTap: () {},
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            MenuItem(
              title: 'Feedback',
              onTap: () {},
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            MenuItem(
              title: 'Settings',
              onTap: () {},
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            MenuItem(
              title: 'Share',
              onTap: () {},
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            MenuItem(
              title: 'Get in touch!',
              onTap: () {},
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ]),
      body: const Center(
        child: Text('Flutter animated FAB Menu'),
      ),
    );
  }
}
```
   </td>
   <td>
     Here's what it looks like:
     
<hr>


https://user-images.githubusercontent.com/68671238/134640734-751456fa-686b-4e77-bc8d-04ba3a324baf.mp4


   </td>
  </tr>
  </table>
<hr>

## Next Goals
We are working on some improvements including:

- [x] Change color and opacity for menu background. Change color and opacity by specifying `overlayColor` and `overlayOpacity` properties.
- [ ] Make the distance between menu items customizable.
- [ ] Change opening animation with more smooth and user friendly one.

## Issues & Feedback
Please file an [issue!](https://github.com/aliMissaoui/Flutter-Animated-FAB-Menu/issues) to send feedback or report a bug. Thank you!

