# SwiftGIF

[![Version](https://img.shields.io/cocoapods/v/SwiftGIF.svg?style=flat)](http://cocoadocs.org/docsets/SwiftGIF)
[![License](https://img.shields.io/cocoapods/l/SwiftGIF.svg?style=flat)](http://cocoadocs.org/docsets/SwiftGIF)
[![Platform](https://img.shields.io/cocoapods/p/SwiftGIF.svg?style=flat)](http://cocoadocs.org/docsets/SwiftGIF)

## Usage

```Swift
createGIF(with: [UIImage(named: "img1"), UIImage(named: "img2")], 0.15) { (data, error) -> () in
    if error == nil {
        // do something with the data          
    }
}
```

A better example would be to fetch a couple of images from a source somewhere.

## Installation

SwiftGIF is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "SwiftGIF"

## Author

Simon Westerlund, s@simonwesterlund.se

## License

SwiftGIF is available under the WTFPL license. See the LICENSE file for more info.

