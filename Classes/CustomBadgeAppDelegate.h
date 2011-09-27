//
//  CustomBadgeAppDelegate.h
//  CustomBadge
//


#import <UIKit/UIKit.h>

@class CustomBadgeViewController;

@interface CustomBadgeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CustomBadgeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CustomBadgeViewController *viewController;

@end

