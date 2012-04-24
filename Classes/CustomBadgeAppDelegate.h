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

@property (nonatomic) IBOutlet UIWindow *window;
@property (nonatomic) IBOutlet CustomBadgeViewController *viewController;

@end

