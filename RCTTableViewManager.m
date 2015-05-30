#import "RCTTableViewManager.h"

#import "RCTBridge.h"
#import "RCTConvert.h"
#import "RCTSparseArray.h"
#import "RCTUIManager.h"
#import "RCTTableView.h"

//@import UIKit;

@implementation RCTTableViewManager

RCT_EXPORT_MODULE()

- (UIView *)view {
  return [[RCTTableView alloc] initWithEventDispatcher:self.bridge.eventDispatcher];;
}

RCT_CUSTOM_VIEW_PROPERTY(tableViewStyle, UITableViewStyle, RCTTableView) {
  [view setTableViewStyle:[RCTConvert NSInteger:json]];
}

// RCT_EXPORT_VIEW_PROPERTY(numberOfSections, NSInteger)
// RCT_EXPORT_VIEW_PROPERTY(numberOfRowsInSection, NSArray)

RCT_EXPORT_VIEW_PROPERTY(cellForRowAtIndexPath, NSArray)

RCT_CUSTOM_VIEW_PROPERTY(tableViewCellStyle, UITableViewStyle, RCTTableView) {
  [view setTableViewCellStyle:[RCTConvert NSInteger:json]];
}

- (NSDictionary *)constantsToExport {
  return @{
           @"Style": @{
               @"Plain": @(UITableViewStylePlain),
               @"Grouped": @(UITableViewStyleGrouped)
               },
           @"CellStyle": @{
               @"Default": @(UITableViewCellStyleDefault),
               @"Value1": @(UITableViewCellStyleValue1),
               @"Value2": @(UITableViewCellStyleValue2),
               @"Subtitle": @(UITableViewCellStyleSubtitle)
               }
           };
}

@end
