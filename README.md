# mm_phonenumber_swift

[![CI Status](http://img.shields.io/travis/wailynn-wlz/mm_phonenumber_swift.svg?style=flat)](https://travis-ci.org/wailynn-wlz/mm_phonenumber_swift)
[![Version](https://img.shields.io/cocoapods/v/mm_phonenumber_swift.svg?style=flat)](http://cocoapods.org/pods/mm_phonenumber_swift)
[![License](https://img.shields.io/cocoapods/l/mm_phonenumber_swift.svg?style=flat)](http://cocoapods.org/pods/mm_phonenumber_swift)
[![Platform](https://img.shields.io/cocoapods/p/mm_phonenumber_swift.svg?style=flat)](http://cocoapods.org/pods/mm_phonenumber_swift)

## Usage

```
import mm_phonenumber_swift

PhoneValidator.isValidMMPhoneNumber(phoneNumber: "<your phone number>")
        
PhoneValidator.sanitizeNumber(phoneNumber: "<your phone number>")
      
PhoneValidator.getTelecomName(phoneNumber: "<your phone number>")

PhoneValidator.getNetworkType(phoneNumber: "<your phne number>")
```

## Requirements

## Installation

mm_phonenumber_swift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'mm_phonenumber_swift'
```

## Author

wailynnzaw.lamz@gmail.com

## License

mm_phonenumber_swift is available under the MIT license. See the LICENSE file for more info.
