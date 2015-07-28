//
//  MasterViewController.m
//  DocumentInteraction
//
//  Created by Jeffrey Kereakoglow on 7/27/15.
//  Copyright (c) 2015 Alexis Digital. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()

@property (nonatomic, readwrite) NSArray *dataSource;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource = [self arrayFromPropertyList:@"DocumentURLs"];
}

#pragma mark - Helpers
/**
 Searches the main bundle for a property list with the name provided by the argument @c propertyListName. The root item of the property list must be a dictionary because this method returns an array of dictionary keys.
 @param propertyListName The name of the property list to load.
 @since 1.0
 @author Jeff Kereakoglow
 */
- (NSArray *)arrayFromPropertyList:(NSString *)propertyListName {
    NSString* resourcePath = [[NSBundle mainBundle] pathForResource:propertyListName
                                                             ofType:@"plist"];

    NSAssert(resourcePath, @"\n\n  ERROR in %s: Could not find the property list resource.\n\n", __PRETTY_FUNCTION__);

    NSArray *items;

    items = [NSArray arrayWithContentsOfFile:resourcePath];

    NSAssert(items, @"\n\n  ERROR in %s: Could not load the property list resource. Make sure the root item of the property list is a Dictionary.\n\n", __PRETTY_FUNCTION__);
    
    return items;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView * __unused)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView * __unused)tableView numberOfRowsInSection:(NSInteger __unused)section {
    return (NSInteger)self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                        forIndexPath:indexPath];
    NSDictionary *row = self.dataSource[(NSUInteger)indexPath.row];

    cell.textLabel.text = row.allKeys.firstObject;
    return cell;
}



#pragma mark - QLPreviewControllerDataSource

// Returns the number of items that the preview controller should preview
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController * __unused)previewController {
    return (NSInteger)self.dataSource.count;
}

- (void)previewControllerDidDismiss:(QLPreviewController * __unused)controller {
    // if the preview dismissed (done button touched), use this method to post-process previews
}

// returns the item that the preview controller should preview
- (id)previewController:(QLPreviewController * __unused)previewController previewItemAtIndex:(NSInteger)idx {
    NSURL *fileURL;
    NSString *fileName = ((NSDictionary *)self.dataSource[(NSUInteger)idx]).allValues.firstObject;

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


#pragma mark - File system support
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


@end
