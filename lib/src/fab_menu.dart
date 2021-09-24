import 'package:animated_fab_button_menu/src/item_child.dart';
import 'package:animated_fab_button_menu/src/fab_menu_item.dart';
import 'package:animated_fab_button_menu/src/hero_dialog_route.dart';
import 'package:flutter/material.dart';

class FabMenu extends StatefulWidget {
  /// Used to set the fab Icon.
  final Widget? fabIcon;

  /// Used to set the fab background color.
  final Color? fabBackgroundColor;

  /// Used to set the menu close Icon.
  final Widget? closeMenuButton;

  /// Used to set the fab alignment.
  final Alignment? fabAlignment;

  /// The color of the menu background overlay.
  final Color? overlayColor;

  /// The opacity of the menu background overlay.
  /// Default: 0.8
  final double? overlayOpacity;

  /// Used to set the elevation of the fab button.
  /// Default: 1.0
  final double? elevation;

  /// Children buttons of the menu, from the lowest to the highest.
  final List<MenuItem> children;

  /// Animated FAB menu button.
  const FabMenu(
      {Key? key,
      this.fabIcon,
      this.fabBackgroundColor,
      this.fabAlignment,
      this.overlayColor,
      this.overlayOpacity,
      this.elevation,
      this.closeMenuButton,
      required this.children})
      : super(key: key);

  @override
  _FabMenuState createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.fabAlignment ?? Alignment.bottomCenter,
      child: FloatingActionButton(
        heroTag: 'main-btn-tag',
        backgroundColor: widget.fabBackgroundColor ?? Colors.black,
        elevation: widget.elevation ?? 1.0,
        onPressed: () {
          Navigator.of(context).push(
            HeroDialogRoute(
              builder: (context) {
                return MainMenu(
                  closeMenuButton: widget.closeMenuButton ??
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                  backgroundColor: widget.overlayColor ?? Colors.black,
                  overlayOpacity: widget.overlayOpacity ?? 0.8,
                  children: widget.children,
                );
              },
            ),
          );
        },
        child: widget.fabIcon ?? const Icon(Icons.more_horiz),
      ),
    );
  }
}

// Full screen main menu
class MainMenu extends StatefulWidget {
  /// Used to set the menu close Icon.
  final Widget closeMenuButton;

  /// Used to get the background color of the menu list.
  final Color backgroundColor;

  /// Used to get the opacity of the background color of the menu list.
  final double overlayOpacity;

  /// Children buttons of the menu, from the lowest to the highest.
  final List<MenuItem> children;

  const MainMenu(
      {Key? key,
      required this.backgroundColor,
      required this.overlayOpacity,
      required this.closeMenuButton,
      required this.children})
      : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _getChildrenList() {
      return widget.children
          .map((MenuItem child) {
            int index = widget.children.indexOf(child);
            return Column(
              children: [
                ItemChild(
                  index: index,
                  title: child.title,
                  style: child.style,
                  onTap: child.onTap,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          })
          .toList()
          .reversed
          .toList();
    }

    var fabChildren = _getChildrenList();

    return Hero(
      tag: 'main-btn-tag',
      child: Material(
        color: widget.backgroundColor.withOpacity(widget.overlayOpacity),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: List.from(fabChildren),
                      reverse: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.transparent,
                        child: widget.closeMenuButton,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
