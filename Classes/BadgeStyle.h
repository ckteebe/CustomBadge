/*
 
 ------------------------------------------------------------------------------------
 BadgeStyle.h
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




@import UIKit;

typedef enum : NSUInteger {
    BadgeStyleFontTypeHelveticaNeueMedium,
    BadgeStyleFontTypeHelveticaNeueLight,
} BadgeStyleFontType;

@interface BadgeStyle : NSObject {

    UIColor *badgeTextColor;
    UIColor *badgeInsetColor;
    UIColor *badgeFrameColor;
    BOOL badgeFrame;
    BOOL badgeShining;
    BadgeStyleFontType badgeFontType;

}

@property(nonatomic, strong) UIColor *badgeTextColor;
@property(nonatomic, strong) UIColor *badgeInsetColor;
@property(nonatomic, strong) UIColor *badgeFrameColor;
@property(nonatomic) BadgeStyleFontType badgeFontType;
@property(nonatomic) BOOL badgeFrame;
@property(nonatomic) BOOL badgeShining;
@property(nonatomic) BOOL badgeShadow;


+ (BadgeStyle*) defaultStyle;
+ (BadgeStyle*) oldStyle;
+ (BadgeStyle*) freeStyleWithTextColor:(UIColor*)textColor withInsetColor:(UIColor*)insetColor withFrameColor:(UIColor*)frameColor withFrame:(BOOL)frame withShadow:(BOOL)shadow withShining:(BOOL)shining withFontType:(BadgeStyleFontType)fontType;


@end

