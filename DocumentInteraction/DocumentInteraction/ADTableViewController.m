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

@property (nonatomic, readwrite) NSArray *dataSource;
@end

@implementation ADTableViewController

#pragma mark - UITableViewD
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];

  // Create a new QuickLook controller and push it on to the navigation
  // controller.
  QLPreviewController *previewController = [QLPreviewController new];
  previewController.dataSource = self.viewModel;
  previewController.delegate = self;
  previewController.currentPreviewItemIndex = indexPath.row;

  [self.navigationController pushViewController:previewController
                                       animated:YES];
}

#pragma mark - QLPreviewControllerDataSource

// Returns the number of items that the preview controller should preview
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController * __unused)previewController {
  return (NSInteger)self.dataSource.count;
}

// returns the item that the preview controller should preview
- (id<QLPreviewItem>)previewController:(QLPreviewController * __unused)previewController previewItemAtIndex:(NSInteger)idx {
  NSURL *fileURL;
  NSString *fileName;

  // Get the file name which is defined in the property list.
  fileName = ((NSDictionary *)self.dataSource[(NSUInteger)idx]).allValues.firstObject;

  NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];

  switch (selectedIndexPath.row) {
    case 0:
      fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                        pathForResource:fileName
                                        ofType:nil]];
      break;

    default:
      fileURL = [self.dataSource objectAtIndex:(NSUInteger)idx];
  }

  return fileURL;
}

@end
