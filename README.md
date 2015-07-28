# Document interaction
Demonstrates how to present documents within an app using the [QuickLook][ql]
framework.

This is a simpler version of Apple's [DocInteraction][doc] sample application.
Simpler in that it only contains code which is necessary for displaying content
using QuickLook. Apple's sample app has extraneous code, some of which is
written in C.

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
