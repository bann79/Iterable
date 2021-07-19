# Iterable
Iterable Take Home Test - SwiftUI

Author: Bann Al-Jelawi
Date: 19/07/21
Platform: iOS (14.1)/ XCode12
Language: SwiftUI

Description: A completed take home test from Iterable to show a basic SDK implementation. I have reached the end point message in two ways with two different email addresses so as to kick the message out a second time. The first time I had nothing specific in place to show the message so once the silent push to the app was recieved on my device, the Iterable SDK automatically rendered the message on screen. The second time I tried this, I used IterableAPI.inAppManager.isAutoDisplayPaused = true just after the SDK init so it would queue the message instead. I then had a button to set isAutoDisplayPaused = false and call the first message in the queue and it showed the queued message on button tap.

