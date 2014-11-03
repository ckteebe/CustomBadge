/*
 
 ------------------------------------------------------------------------------------
 BadgeStyle.m
 ------------------------------------------------------------------------------------
 CustomBadge Version 3 comes with better separation between style and rendering.
 This class provides all informtion (Colors, Options, Font, ...) for the drawing
 The drawing itself happens in the "CustomBadge.m" class
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

#import "BadgeStyle.h"

@interface BadgeStyle ()

@end

@implementation BadgeStyle

@synthesize badgeTextColor;
@synthesize badgeInsetColor;
@synthesize badgeFrameColor;
@synthesize badgeShining;
@synthesize badgeShadow;
@synthesize badgeFrame;
@synthesize badgeFontType;


/* Creates default BadgeStyle which means:
 - Helvetica Neue Light as font
 - White text
 - Red background color
 - No frame, shadow or shining */
+ (BadgeStyle*) defaultStyle {
    
    id instance = [[super alloc] init];
    [instance setBadgeFontType:BadgeStyleFontTypeHelveticaNeueLight];
    [instance setBadgeTextColor:[UIColor whiteColor]];
    [instance setBadgeInsetColor:[UIColor redColor]];
    [instance setBadgeFrameColor:nil];
    [instance setBadgeFrame:NO];
    [instance setBadgeShadow:NO];
    [instance setBadgeShining:NO];
    return instance;
}

/* Creates prior to iOS7 style BadgeStyle which means:
 - Helvetica Neue Medium as font
 - White text
 - Red background color
 - With frame, shadow or shining */
+ (BadgeStyle*) oldStyle {
    
    id instance = [[super alloc] init];
    [instance setBadgeFontType:BadgeStyleFontTypeHelveticaNeueMedium];
    [instance setBadgeTextColor:[UIColor whiteColor]];
    [instance setBadgeInsetColor:[UIColor redColor]];
    [instance setBadgeFrameColor:[UIColor whiteColor]];
    [instance setBadgeFrame:YES];
    [instance setBadgeShadow:YES];
    [instance setBadgeShining:YES];
    return instance;
}


/* Create your own BadgeStyle */
+ (BadgeStyle*) freeStyleWithTextColor:(UIColor*)textColor withInsetColor:(UIColor*)insetColor withFrameColor:(UIColor*)frameColor withFrame:(BOOL)frame withShadow:(BOOL)shadow withShining:(BOOL)shining withFontType:(BadgeStyleFontType)fontType {

    id instance = [[super alloc] init];
    [instance setBadgeFontType:fontType];
    [instance setBadgeTextColor:textColor];
    [instance setBadgeInsetColor:insetColor];
    [instance setBadgeFrameColor:frameColor];
    [instance setBadgeFrame:frame];
    [instance setBadgeShadow:shadow];
    [instance setBadgeShining:shining];
    return instance;

}





@end
