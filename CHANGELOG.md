# CHANGELOG

## 3.1.0
* Added shadows parameter to add a shadow to the dots (Thanks to [PR#24](https://github.com/Pyozer/dots_indicator/pull/26))
* Add shadow property for active dots (Thanks to [PR#29](https://github.com/Pyozer/dots_indicator/pull/29))
* Added parameter to allow for an indefinite pager indicator behavior (Thanks to [PR#28](https://github.com/Pyozer/dots_indicator/pull/28))
* Regenerate example app

## 3.0.0
* Changed position to int + fixed sample (Thanks to [PR#24](https://github.com/Pyozer/dots_indicator/pull/24))

## 2.1.2
* REVERT: Changed position to int + fixed sample (Thanks to [PR#24](https://github.com/Pyozer/dots_indicator/pull/24))

## 2.1.1
* Changed position to int + fixed sample (Thanks to [PR#24](https://github.com/Pyozer/dots_indicator/pull/24))

## 2.1.0

* Add specific color for each dot, colors/activeColors params added (Thanks to [PR#7](https://github.com/Pyozer/dots_indicator/pull/7))
* Add specific size for each dot, sizes/activeSizes params added
* Add specific shape for each dot, shapes/activeShapes params added
* Replace default light blue for active color, by the theme primary color (Thanks to [Issue#20](https://github.com/Pyozer/dots_indicator/issues/20))
* Update example app

## 2.0.0

* Add null-safety support (Thanks to [PR#15](https://github.com/Pyozer/dots_indicator/pull/15))

## 1.2.0

* Add `onTap` callback (Thanks to [PR#10](https://github.com/Pyozer/dots_indicator/pull/10))

## 1.1.0

* Set position to `double` and add transition between dots (Thanks to [PR#8](https://github.com/Pyozer/dots_indicator/pull/8))

## 1.0.0

* Add `axis` property to have possibility to display dots as vertical
* Add `reversed` property to display dots in reverse position
* Add example app

## 0.0.5+1

* Fix assert on `position` property

## 0.0.5

* __BREAKING :__ Now dots customizations like color, size and spacing are provided by a DotsDecorator model with `decorator` property.

## 0.0.4

* Fix full width of the widget. (Thanks to fvisticot)
  
## 0.0.3

* Publish on Pub

## 0.0.2

* Add asserts to avoid bug

## 0.0.1

* Initial Release
