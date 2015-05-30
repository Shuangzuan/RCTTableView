#import "RCTTableView.h"

#import "RCTConvert.h"
#import "RCTEventDispatcher.h"
#import "RCTLog.h"
#import "RCTUIManager.h"
#import "RCTUtils.h"
#import "UIView+React.h"

static NSString * const CellIdentifier = @"Cell";

@interface RCTTableView () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) RCTEventDispatcher *eventDispatcher;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation RCTTableView

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher {
  if ((self = [super initWithFrame:CGRectZero])) {
    _eventDispatcher = eventDispatcher;
  }
  return self;
}

#pragma mark - Properties

- (void)setTableViewStyle:(UITableViewStyle)tableViewStyle {
  _tableViewStyle = tableViewStyle;
  
  [self createTableView];
}

#pragma mark -

- (void)layoutSubviews {
  // Maybe something better
  [self.tableView setFrame:self.frame];
}

#pragma mark - Private APIs

- (void)createTableView {
  _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:_tableViewStyle];
  _tableView.dataSource = self;
  _tableView.delegate = self;
  
  [self addSubview:_tableView];
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *model = self.cellForRowAtIndexPath[[indexPath section]][[indexPath row]];

  // TODO: Refactor
  for (NSString *propertyName in model) {
    for (NSString *subPropertyName in model[propertyName]) {
      NSString *keyPath = [NSString stringWithFormat:@"%@.%@", propertyName, subPropertyName];
      [cell setValue:[model valueForKeyPath:keyPath] forKeyPath:keyPath];
    }
  }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [self.cellForRowAtIndexPath count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.cellForRowAtIndexPath[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (!cell) cell = [[UITableViewCell alloc] initWithStyle:self.tableViewCellStyle reuseIdentifier:CellIdentifier];
  
  [self configureCell:cell forRowAtIndexPath:indexPath];
  
  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *event = @{
                          @"target": self.reactTag,
                          @"indexPath": @{
                              @"section": @([indexPath section]),
                              @"row": @([indexPath row])
                              }
                          };
  [self.eventDispatcher sendInputEventWithName:@"topTap" body:event];
}

@end
