/*
 
 ------------------------------------------------------------------------------------
 CustomBadge.h
 ------------------------------------------------------------------------------------
 CustomBadge is an UIView which draws a customizable badge on any other view.
 The latest version has separation between style and rendering.
 This class is the core of CustomBadge where the actual rendering happens.
 It recommended to use the convenient allocators instead of the init methods.
 ------------------------------------------------------------------------------------
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Sascha Paulus
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

*/

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BadgeStyle.h"

@interface CustomBadge : UIView {
	NSString *badgeText;
	CGFloat badgeCornerRoundness;
	CGFloat badgeScaleFactor;
    BadgeStyle *badgeStyle;
}

@property(nonatomic, strong) NSString *badgeText;
@property(nonatomic, strong) BadgeStyle *badgeStyle;
@property(nonatomic) CGFloat badgeCornerRoundness;
@property(nonatomic) CGFloat badgeScaleFactor;

+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString;
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString withScale:(CGFloat)scale;
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString withStyle:(BadgeStyle*)style;
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString withScale:(CGFloat)scale withStyle:(BadgeStyle*)style;

- (void) autoBadgeSizeWithString:(NSString *)badgeString;

@end
