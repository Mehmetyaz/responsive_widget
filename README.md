# responsive_widget

Responsive Stateful or Stateless Widget

## Getting Started

 The responsive_widget package contains widgets that allows you to create a responsive UI.
 
 In this package created for create page structures for different devices (or sizes).
 
 With this package, you need to overwrite 4 different build methods :
 
 - `buildMobile`
 - `buildWideMobileOrTablet`
 - `buildWideTabletOrDesktop`
 - `buildDesktop`

 This package should only be used where the entire structure needs to be changed when resizing.

###Save State
 For my purpose of creating this package :
    The state is not lost in case of size change (especially on the web).
    
 


## Import It
`import 'package:responsive_widget/responsive_widget.dart';`

## Create Page
 
###Stateful Widget
 
 In this package , state does not disappear in structure changes.
 
 Replace with `ResponsiveState` instead of `State` only.
 
 After than create missing overrides.
 
 ````dart
 class ResponsiveWelcomePage extends StatefulWidget {

    @override
    _ResponsiveWelcomePageState createState() => _ResponsiveWelcomePageState();
  }

  // !!! Extends ResponsiveState
  class _ResponsiveWelcomePageState
      extends ResponsiveState<ResponsiveWelcomePage> {
    @override
    Widget buildDesktop(BuildContext context) {}
    
    @override
    Widget buildMobile(BuildContext context) {}
  
    @override
    Widget buildWideMobileOrTablet(BuildContext context) {}
  
    @override
    Widget buildWideTabletOrDesktop(BuildContext context) {}
  }
````

###Stateless Widget
 
 Extends ResponsiveWidget and create missing overrides.
 
 ````dart
//Extends [ResponsiveWidget]
class ResponsiveStatelessExample extends ResponsiveWidget {
  // Overrides
}
````

##### Reducing Varieties

 ````dart
//Extends [ResponsiveWidget]
class ResponsiveStatelessExample extends ResponsiveWidget {
  // Overrides
    @override
    Widget buildMobile(BuildContext context) {
      return Container();
    }

    @override
    Widget buildWideMobileOrTablet(BuildContext context) => buildMobile();

}
````

