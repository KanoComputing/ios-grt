# ios-grt

🚨 An unmaintained proof of concept.🚨

An incomplete Objective-C wrapper for the [GRT library](https://github.com/nickgillian/grt).
The project builds into a CocoaTouch Framework for iOS.

At the moment, it exposes the following classes:

 * DTW
 * HMM
 * TimeSeriesClassificationData
 * MatrixFloat
 * VectorFloat
 * KMeansQuantizer

## Build

Don't forget to fetch submodules before building:

    git submodule init
    git submodule update

To build with debugging symbols:

    xcodebuild -target ios-grt -configuration Debug -sdk iphoneos clean build

Building for production:

    xcodebuild -target ios-grt -configuration Release -sdk iphoneos clean build

Building for the iOS simulator:

    xcodebuild -target ios-grt -configuration Debug -sdk iphonesimulator clean build

The built `ios-grt.framework` will be at:

    build/${configuration}-${sdk}/ios_grt.framework

## Licence

The ios-grt Framework is available under an MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE
