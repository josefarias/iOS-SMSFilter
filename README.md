#  Simple SMS Filtering App for iOS

Grew tired of spam SMS messages. App store alternatives had a pay wall. So I built my own solution. Nothing fancy, works for my needs.

The app will filter incoming messages containing any of the registered words. Messages will still appear in your `Messages` app but you won't be notified upon receiving them.

iOS will usually take you straight to a list of all allowed messages when you open the app. To see filtered messages:
1. Tap on `< Filters` at the top left (not sure if `Settings>Messages>Unknown & Spam>Filter Unknown Senders` has to be on)
1. Tap on the `Junk` section

Make sure you check for false positives every now and then.

Messages from your existing contacts and senders using iMessage won't be filtered per https://developer.apple.com/documentation/sms_and_call_reporting/sms_and_mms_message_filtering

![UI Preview](https://user-images.githubusercontent.com/31393016/132107452-e2a477e9-9b53-48b4-af87-020de8566d89.png)

### Activation Steps
1. Install App
2. Go to `Settings>Messages>Unknown & Spam (Message Filtering Section)` and select `SMSFilter` (the name of this app) as your SMS Filtering solution.

### Disclaimer
I am not an iOS engineer so I can't guarantee this app follows any sort of standards.

### Compiling and Installing by yourself
Again, not an iOS expert but I'd expect you'd need to change the `Team` and `Bundle Identifier` options for each target under `project>[Target Name]>Signing & Capabilities`.

After building and running on your own phone, you'll have to go to `Settings>General>Device Management` and explicitly trust your Apple developer account to be able to open the app on your device.

### References
1. https://youtu.be/rjHBINtpKA8
2. https://medium.com/@lucianboboc/creating-a-message-filter-extension-580c9957633d
3. https://www.avanderlee.com/swift/core-data-app-extension-data-sharing/
4. https://medium.com/@manibatra23/sharing-data-using-core-data-ios-app-and-extension-fb0a176eaee9

### Testing and Debugging
Only reliable way of testing I found was by opening a Twilio account and sending SMS messages to myself 
