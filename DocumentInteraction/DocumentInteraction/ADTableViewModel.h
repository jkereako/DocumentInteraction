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

@interface ADTableViewModel : NSObject<UITableViewDataSource, QLPreviewControllerDataSource>

- (NSArray *)arrayFromPropertyList:(NSString *)propertyListName;

@end
