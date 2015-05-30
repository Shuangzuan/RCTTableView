#import <UIKit/UIKit.h>

#import "RCTView.h"

@class RCTEventDispatcher;

@interface RCTTableView : RCTView

@property (assign, nonatomic) UITableViewStyle tableViewStyle;
@property (strong, nonatomic) NSArray *cellForRowAtIndexPath;
@property (assign, nonatomic) UITableViewCellStyle tableViewCellStyle;

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;

@end
