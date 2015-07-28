# Document interaction
Demonstrates how to present documents within an app using the [QuickLook][ql]
framework.

<img src="https://raw.githubusercontent.com/jkereako/ios-document-interaction/master/screen-1.png" alt="Document list" width="320" height="568" />

<img src="https://raw.githubusercontent.com/jkereako/ios-document-interaction/master/screen-2.png" alt="Document list" width="320" height="568" />

This project is based off of Apple's [DocInteraction][doc] sample application.
DocInteraction contains extraneous and needless code where as this project
contains only the code required to use QuickLook. This project is a better
starting point for understanding QuickLook.

# Installation
Clone this repository and open the project file in Xcode. Run the app in the
simulator and you'll be in business.

There are 2 screens. The first screen is a table view containing all of the
available documents. The second screen is the QuickLook view controller.

# Notes
The source documents are located in the directory, `documents`. The app keeps
track of the available documents in the property list, `DocumentURLs`. If you
want to add another document to the project, add the document to the `documents`
directory, drag the document into the project in XCode to make sure that XCode
knows about the file and then enter the document name in the `DocumentURLs`.

[doc]:
https://developer.apple.com/library/ios/samplecode/DocInteraction/Introduction/Intro.html
[ql]:https://developer.apple.com/library/ios/documentation/QuickLook/Reference/QuickLookFrameworkReference_iPhoneOS/
