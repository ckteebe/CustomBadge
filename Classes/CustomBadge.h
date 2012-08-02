/*
 CustomBadge.h
 
 *** Description: ***
 With this class you can draw a typical iOS badge indicator with a custom text on any view.
 Please use the allocator customBadgeWithString to create a new badge.
 In this version you can modfiy the color inside the badge (insetColor),
 the color of the frame (frameColor), the color of the text and you can
 tell the class if you want a frame around the badge.
 
 *** License & Copyright ***
 Created by Sascha Marc Paulus www.spaulus.com on 04/2011. Version 2.0
 This tiny class can be used for free in private and commercial applications.
 Please feel free to modify, extend or distribution this class. 
 If you modify it: Please send me your modified version of the class.
 A commercial distribution of this class is not allowed.
 
 I would appreciate if you could refer to my website www.spaulus.com if you use this class.
 
 If you have any questions please feel free to contact me (open@spaulus.com).
 */

#import <QuartzCore/QuartzCore.h>

#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
#import <UIKit/UIKit.h>

@interface CustomBadge : UIView {

	UIColor *badgeTextColor;
	UIColor *badgeInsetColor;
	UIColor *badgeFrameColor;
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
@interface CustomBadge : NSView {
    
	NSColor *badgeTextColor;
	NSColor *badgeInsetColor;
	NSColor *badgeFrameColor;
#endif
	NSString *badgeText;
	BOOL badgeFrame;
	BOOL badgeShining;
	CGFloat badgeCornerRoundness;
	CGFloat badgeScaleFactor;
}

@property(nonatomic,retain) NSString *badgeText;
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
@property(nonatomic,retain) UIColor *badgeTextColor;
@property(nonatomic,retain) UIColor *badgeInsetColor;
@property(nonatomic,retain) UIColor *badgeFrameColor;
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
@property(nonatomic,retain) NSColor *badgeTextColor;
@property(nonatomic,retain) NSColor *badgeInsetColor;
@property(nonatomic,retain) NSColor *badgeFrameColor;
#endif

@property(nonatomic,readwrite) BOOL badgeFrame;
@property(nonatomic,readwrite) BOOL badgeShining;

@property(nonatomic,readwrite) CGFloat badgeCornerRoundness;
@property(nonatomic,readwrite) CGFloat badgeScaleFactor;

+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString;
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString withStringColor:(UIColor*)stringColor withInsetColor:(UIColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(UIColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining;
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString withStringColor:(NSColor*)stringColor withInsetColor:(NSColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(NSColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining;
#endif
- (void) autoBadgeSizeWithString:(NSString *)badgeString;

@end
