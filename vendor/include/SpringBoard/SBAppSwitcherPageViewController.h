#import <UIKit/UIViewController.h>

@class SBDisplayItem;

@interface SBAppSwitcherPageViewController : UIViewController

- (void)cancelPossibleRemovalOfDisplayItem:(SBDisplayItem *)displayItem;

@end
