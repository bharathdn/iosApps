# iosApps
ios Apps developed in Swift

# Pre-work - Tip Buddy
Tip Buddy is a tip calculator application for iOS.

Submitted by: Bharath D N Reddy

Time spent: 13 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Added a slider for selecting tip % instead of segment control, this gives more flexibilty while selecting % of tip 

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/guqHuPV.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

challenges encountered while building the app: 
* Figuring out the animations between views. i.e., how to have an initial view  and animate/transition to another when user starts typing the numbers
* Print statements won't print to console after app is terminated! this made it challenging to experiment with the lifecycle methods


## License

    Copyright 2017 Bharath D N Reddy

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
