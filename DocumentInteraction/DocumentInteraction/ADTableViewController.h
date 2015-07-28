//
//  MasterViewController.h
//  DocumentInteraction
//
//  Created by Jeffrey Kereakoglow on 7/27/15.
//  Copyright (c) 2015 Alexis Digital. All rights reserved.
//

@import UIKit;
@import QuickLook;

/**
 The responsibility of this class is to handle actions initiated by the user.
 */
@interface ADTableViewController : UITableViewController <UITableViewDelegate, QLPreviewControllerDelegate>

@end

