# dots_indicator

Widget to display dots indicator to show a position (for a pageview for example).

# Installation

You just need to add `dots_indicator` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

This package is not upload to Pub yet.
So you need to add it from Git repository:
```yaml
dependencies:
  dots_indicator: ^0.0.3
```

# Example

In these example, `pageLength` is the total of dots to display and `currentIndexPage` is the position to hightlight (the active dot).

### A simple dots indicator

![Simple dots](https://raw.githubusercontent.com/Pyozer/dots_indicator/master/demo/normal.gif)

```dart
new DotsIndicator(
  numberOfDot: pageLength,
  position: currentIndexPage
)
```

### Custom colors

![Custom dots colors](https://raw.githubusercontent.com/Pyozer/dots_indicator/master/demo/custom_color.gif)

```dart
new DotsIndicator(
  numberOfDot: pageLength,
  position: currentIndexPage,
  dotColor: Colors.black87,
  dotActiveColor: Colors.redAccent
)
```

### Custom size

You can change the default size of dots.<br />
So you can choose to have dots for no active positions and a rounded rectangle for active position for example.<br />
**By default, the shape of dots is CircleBorder, so to have a rounded rectangle for active, you need to change dotActiveShape**

![Custom dots size](https://raw.githubusercontent.com/Pyozer/dots_indicator/master/demo/custom_size.gif)

```dart
new DotsIndicator(
  numberOfDot: pageLength,
  position: currentIndexPage,
  dotSize: const Size.square(9.0),
  dotActiveSize: const Size(18.0, 9.0),
  dotActiveShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
)
```

### Custom shape

You can change the default shape of dots. By default it's a CircleBorder.<br />
You can change the no active and active dot shape.

![Custom dots shape](https://raw.githubusercontent.com/Pyozer/dots_indicator/master/demo/custom_shape.gif)

```dart
new DotsIndicator(
  numberOfDot: pageLength,
  position: currentIndexPage,
  dotShape: const Border(),
  dotActiveShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
)
```

### Change the space between dots

By default a dot have a margin of 6 pixels on his left and right. It's `EdgeInsets.symmetric(horizontal: 6.0)`.
But if you want you can change it, for example to increase the space between dots or to add top margin.

![Custom dots space](https://raw.githubusercontent.com/Pyozer/dots_indicator/master/demo/custom_space.gif)

```dart
new DotsIndicator(
  numberOfDot: pageLength,
  position: currentIndexPage,
  dotSpacing: const EdgeInsets.all(10.0)
)
```

