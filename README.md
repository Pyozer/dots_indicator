# dots_indicator

Widget to display dots indicator to show a position (for a PageView for example).

## Installation

You just need to add `dots_indicator` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

```yaml
dependencies:
  dots_indicator: ^1.0.0
```

## Example

In these example, `pageLength` is the total of dots to display and `currentIndexPage` is the position to hightlight (the active dot).

### A simple dots indicator

![Simple dots](https://raw.githubusercontent.com/Pyozer/dots_indicator/master/demo/normal.gif)

```dart
new DotsIndicator(
  dotsCount: pageLength,
  position: currentIndexPage
)
```

### Custom colors

![Custom dots colors](https://raw.githubusercontent.com/Pyozer/dots_indicator/master/demo/custom_color.gif)

```dart
new DotsIndicator(
  dotsCount: pageLength,
  position: currentIndexPage,
  decorator: DotsDecorator(
    color: Colors.black87,
    activeColor: Colors.redAccent,
  ),
)
```

### Custom size

You can change the default size of dots.<br />
So you can choose to have dots for no active positions and a rounded rectangle for active position for example.<br />
**By default, the shape of dots is CircleBorder, so to have a rounded rectangle for active, you need to change `activeShape`**

![Custom dots size](https://raw.githubusercontent.com/Pyozer/dots_indicator/master/demo/custom_size.gif)

```dart
new DotsIndicator(
  dotsCount: pageLength,
  position: currentIndexPage,
  decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
)
```

### Custom shape

You can change the default shape of dots. By default it's a CircleBorder.<br />
You can change the no active and active dot shape.

![Custom dots shape](https://raw.githubusercontent.com/Pyozer/dots_indicator/master/demo/custom_shape.gif)

```dart
new DotsIndicator(
  dotsCount: pageLength,
  position: currentIndexPage,
  decorator: DotsDecorator(
    shape: const Border(),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
)
```

### Change the space between dots

By default a dot have a margin of 6 pixels on his left and right. It's `EdgeInsets.symmetric(horizontal: 6.0)`.
But if you want you can change it, for example to increase the space between dots or to add top margin.

![Custom dots space](https://raw.githubusercontent.com/Pyozer/dots_indicator/master/demo/custom_space.gif)

```dart
new DotsIndicator(
  dotsCount: pageLength,
  position: currentIndexPage,
  decorator: DotsDecorator(
    spacing: const EdgeInsets.all(10.0),
  ),
)
```

### Axis and reverse property

There is two other property, `axis` and `reversed`.
Axis is to display dots indicator horizontally (default) or vertically.
Also, you can set `reversed: true` to reverse the order of dots. (default: false).

For example, if you want to display the dots indicator vertically, but with the first dots on bottom :
Set `axis: Axis.vertical` and `reversed: true`.
Obviously, you can use reversed with `Axis.horizontal`.
