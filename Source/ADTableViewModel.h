//
//  ADTableViewModel.h
//  DocumentInteraction
//
//  Created by Jeffrey Kereakoglow on 7/28/15.
//  Copyright (c) 2015 Alexis Digital. All rights reserved.
//

@import Foundation;
@import UIKit;
@import QuickLook;

/**
 The view model's purpose is to encapsulate all code which is not seen by the
 user. In this particular instance, the view model is responsible for setting up
 the table view datasource as well as the QuickLook data source.
 */
@interface ADTableViewModel: NSObject<UITableViewDataSource, QLPreviewControllerDataSource>

- (NSArray *)arrayFromPropertyList:(NSString *)propertyListName;

@end
