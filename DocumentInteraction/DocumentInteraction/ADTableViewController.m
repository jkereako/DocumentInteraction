//
//  MasterViewController.m
//  DocumentInteraction
//
//  Created by Jeffrey Kereakoglow on 7/27/15.
//  Copyright (c) 2015 Alexis Digital. All rights reserved.
//

#import "ADTableViewController.h"
#import "ADTableViewModel.h"

@interface ADTableViewController ()

@property (nonatomic, weak) IBOutlet ADTableViewModel *viewModel;

@end

@implementation ADTableViewController

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];

  // Create a new QuickLook controller and push it on to the view controller
  // stack.
  QLPreviewController *previewController = [QLPreviewController new];
  previewController.dataSource = self.viewModel;
  previewController.delegate = self;
  previewController.currentPreviewItemIndex = indexPath.row;

  [self.navigationController pushViewController:previewController animated:YES];
}

@end
