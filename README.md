# dots_indicator

Widget to display dots indicator to show a position (for a pageview for example).

# Installation

You just need to add `dots_indicator` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

This package is not upload to Pub yet.
So you need to add it from Git repository:
```yaml
dependencies:
  dots_indicator:
    git: git://github.com/pyozer/dots_indicator
```

# Example

In these example, `pageLength` is the total of dots to display and `currentIndexPage` is the position to hightlight (the active dot).

### A simple dots indicator

```dart
new DotsIndicator(
  numberOfDot: pageLength,
  position: currentIndexPage
)
```

### Custom colors

```dart
new DotsIndicator(
  numberOfDot: pageLength,
  position: currentIndexPage,
  dotColor: Colors.grey,
  dotActiveColor: Colors.blue
)
```

### Custom size

You can change the default size of dots.<br />
So you can choose to have dots for no active positions and a rounded rectangle for active position for example.<br />
**By default, the shape of dots is CircleBorder, so to have a rounded rectangle for active, you need to change dotActiveShape**

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

```dart
new DotsIndicator(
  numberOfDot: pageLength,
  position: currentIndexPage,
  dotSpacing: const EdgeInsets.all(10.0)
)
```

