/*
 
 ------------------------------------------------------------------------------------
 CustomBadgeViewController.h
 ------------------------------------------------------------------------------------
 This is an example which shows the diversity of CustomerBadge.
 With Version 3 comes with better separation between style and rendering.
 BadgeStyle.m contains all style information; In CustomBadge.m happens the rendering.
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

#import "CustomBadgeViewController.h"
#import "CustomBadge.h"

@implementation CustomBadgeViewController


- (void) viewDidLoad
{
    
    [super viewDidLoad];
    
    // An array to hold the badges
    NSMutableArray *badges = [NSMutableArray array];
    
    
    // Creates a badge with scale of 1.5
    CustomBadge *badge1 = [CustomBadge customBadgeWithString:@"CustomBadge" withScale:1.5];
    [badges addObject:badge1];
    
    // Creates a badge with pre-defined style "old" (for prior-iOS7 style)
    CustomBadge *badge2 = [CustomBadge customBadgeWithString:@"Old iOS Style" withScale:1.5 withStyle:[BadgeStyle oldStyle]];
    [badges addObject:badge2];

    // Creates a badge with free customer definitions
    BadgeStyle *badge3Style = [BadgeStyle freeStyleWithTextColor:[UIColor whiteColor]
                                                withInsetColor:[UIColor blueColor]
                                                withFrameColor:nil
                                                     withFrame:NO
                                                    withShadow:NO
                                                   withShining:NO
                                                  withFontType:BadgeStyleFontTypeHelveticaNeueLight];
    
    CustomBadge *badge3 = [CustomBadge customBadgeWithString:@"Retina ready!" withScale:1.5 withStyle:badge3Style];
    [badges addObject:badge3];

    BadgeStyle *badge4Style = [BadgeStyle freeStyleWithTextColor:[UIColor whiteColor]
                                                  withInsetColor:[UIColor purpleColor]
                                                  withFrameColor:[UIColor blackColor]
                                                       withFrame:YES
                                                      withShadow:YES
                                                     withShining:YES
                                                    withFontType:BadgeStyleFontTypeHelveticaNeueLight];
    
    CustomBadge *badge4 = [CustomBadge customBadgeWithString:@"Highly customizable" withScale:2.0 withStyle:badge4Style];
    [badges addObject:badge4];
    
    CustomBadge *badge5 = [CustomBadge customBadgeWithString:@"1"];
    [badges addObject:badge5];

    CustomBadge *badge6 = [CustomBadge customBadgeWithString:@"2" withStyle:[BadgeStyle oldStyle]];
    [badges addObject:badge6];

    
    // Creates a baddge ...
    CustomBadge *badge7 = [CustomBadge customBadgeWithString:@"Easy to use"];
    [badges addObject:badge7];
    [badge7.badgeStyle setBadgeTextColor:[UIColor blackColor]];
    [badge7.badgeStyle setBadgeInsetColor:[UIColor whiteColor]];
    [badge7.badgeStyle setBadgeShadow:YES];
    // ... and change it afterwards with autoBadgeSizeWithString
    [badge7 autoBadgeSizeWithString:@"Easy to use & flexible"];
    
    CustomBadge *badge8 = [CustomBadge customBadgeWithString:@"Still Open & Free" withScale:1.25];
    [badge8.badgeStyle setBadgeShadow:YES];
    [badge8.badgeStyle setBadgeFrame:YES];
    [badge8.badgeStyle setBadgeFrameColor:[UIColor yellowColor]];
    [badges addObject:badge8];


    
    // Put all badges to the screen
    for (int i=0; i<badges.count; i++) {
        CustomBadge *badge = [badges objectAtIndex:i];
        CGFloat y;
        if(i==0) {
            y = 110;
        } else {
            CustomBadge* last = (CustomBadge*)[badges objectAtIndex:i-1];
            y = last.frame.origin.y + last.frame.size.height;
        }
        CGPoint point = CGPointMake(self.view.frame.size.width/2-badge.frame.size.width/2, y);
        CGSize size = CGSizeMake(badge.frame.size.width, badge.frame.size.height);
        CGRect rect = CGRectMake(point.x, point.y, size.width, size.height);
        [badge setFrame:rect];
        [self.view addSubview:badge];
    }
    
}



@end
