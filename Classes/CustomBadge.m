/*
 CustomBadge.m
 
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


#import "CustomBadge.h"

@interface CustomBadge()
- (void) drawRoundedRectWithContext:(CGContextRef)context withRect:(CGRect)rect;
- (void) drawFrameWithContext:(CGContextRef)context withRect:(CGRect)rect;
@end

@implementation CustomBadge

@synthesize badgeText;
@synthesize badgeTextColor;
@synthesize badgeInsetColor;
@synthesize badgeFrameColor;
@synthesize badgeFrame;
@synthesize badgeCornerRoundness;
@synthesize badgeScaleFactor;
@synthesize badgeShining;

// I recommend to use the allocator customBadgeWithString
- (id) initWithString:(NSString *)badgeString withScale:(CGFloat)scale withShining:(BOOL)shining
{
	self = [super initWithFrame:CGRectMake(0, 0, 25, 25)];
	if(self!=nil) {
		self.badgeText = badgeString;
		self.badgeFrame = YES;
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
		self.contentScaleFactor = [[UIScreen mainScreen] scale];
		self.backgroundColor = [UIColor clearColor];
		self.badgeTextColor = [UIColor whiteColor];
		self.badgeFrameColor = [UIColor whiteColor];
		self.badgeInsetColor = [UIColor redColor];
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
		self.badgeTextColor = [NSColor whiteColor];
		self.badgeFrameColor = [NSColor whiteColor];
		self.badgeInsetColor = [NSColor redColor];
#endif
		self.badgeCornerRoundness = 0.4;
		self.badgeScaleFactor = scale;
		self.badgeShining = shining;
		[self autoBadgeSizeWithString:badgeString];		
	}
	return self;
}

// I recommend to use the allocator customBadgeWithString
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
- (id) initWithString:(NSString *)badgeString withStringColor:(UIColor*)stringColor withInsetColor:(UIColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(UIColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
- (id) initWithString:(NSString *)badgeString withStringColor:(NSColor*)stringColor withInsetColor:(NSColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(NSColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining
#endif
{
	self = [super initWithFrame:CGRectMake(0, 0, 25, 25)];
	if(self!=nil) {
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
		self.contentScaleFactor = [[UIScreen mainScreen] scale];
		self.backgroundColor = [UIColor clearColor];
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
#endif
		self.badgeText = badgeString;
		self.badgeTextColor = stringColor;
		self.badgeFrame = badgeFrameYesNo;
		self.badgeFrameColor = frameColor;
		self.badgeInsetColor = insetColor;
		self.badgeCornerRoundness = 0.40;	
		self.badgeScaleFactor = scale;
		self.badgeShining = shining;
		[self autoBadgeSizeWithString:badgeString];
	}
	return self;
}


// Use this method if you want to change the badge text after the first rendering 
- (void) autoBadgeSizeWithString:(NSString *)badgeString
{
	CGSize retValue;
	CGFloat rectWidth, rectHeight;
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
	CGSize stringSize = [badgeString sizeWithFont:[UIFont boldSystemFontOfSize:12]];
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont boldSystemFontOfSize:12],
                                NSFontAttributeName, badgeTextColor,
                                NSForegroundColorAttributeName, nil];
    CGSize stringSize = [self.badgeText sizeWithAttributes:attributes];
#endif
	CGFloat flexSpace;
	if ([badgeString length]>=2) {
		flexSpace = [badgeString length];
		rectWidth = 25 + (stringSize.width + flexSpace); rectHeight = 25;
		retValue = CGSizeMake(rectWidth*badgeScaleFactor, rectHeight*badgeScaleFactor);
	} else {
		retValue = CGSizeMake(25*badgeScaleFactor, 25*badgeScaleFactor);
	}
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, retValue.width, retValue.height);
	self.badgeText = badgeString;
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
	[self setNeedsDisplay];
#endif
}


// Creates a Badge with a given Text 
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString
{
	return [[[self alloc] initWithString:badgeString withScale:1.0 withShining:YES] autorelease];
}


// Creates a Badge with a given Text, Text Color, Inset Color, Frame (YES/NO) and Frame Color 
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString withStringColor:(UIColor*)stringColor withInsetColor:(UIColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(UIColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString withStringColor:(NSColor*)stringColor withInsetColor:(NSColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(NSColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining
#endif
{
	return [[[self alloc] initWithString:badgeString withStringColor:stringColor withInsetColor:insetColor withBadgeFrame:badgeFrameYesNo withBadgeFrameColor:frameColor withScale:scale withShining:shining] autorelease];
}



 

// Draws the Badge with Quartz
-(void) drawRoundedRectWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGContextSaveGState(context);
	
	CGFloat radius = CGRectGetMaxY(rect)*self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect)*0.10;
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
		
    CGContextBeginPath(context);
	CGContextSetFillColorWithColor(context, [self.badgeInsetColor CGColor]);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
	CGContextSetShadowWithColor(context, CGSizeMake(1.0,1.0), 3, [[UIColor blackColor] CGColor]);
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
	CGContextSetShadowWithColor(context, CGSizeMake(1.0,-1.0), 3, [[NSColor blackColor] CGColor]);
#endif
    CGContextFillPath(context);

	CGContextRestoreGState(context);

}

// Draws the Badge Shine with Quartz
-(void) drawShineWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGContextSaveGState(context);
 
	CGFloat radius = CGRectGetMaxY(rect)*self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect)*0.10;
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
	CGContextBeginPath(context);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextClip(context);
	
	
	size_t num_locations = 2;
	CGFloat locations[2] = { 0.0, 0.4 };
	CGFloat components[8] = {  0.92, 0.92, 0.92, 1.0, 0.82, 0.82, 0.82, 0.4 };

	CGColorSpaceRef cspace;
	CGGradientRef gradient;
	cspace = CGColorSpaceCreateDeviceRGB();
	gradient = CGGradientCreateWithColorComponents (cspace, components, locations, num_locations);
	
	CGPoint sPoint, ePoint;
	sPoint.x = 0;
	sPoint.y = 0;
	ePoint.x = 0;
	ePoint.y = maxY;
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
	CGContextDrawLinearGradient (context, gradient, sPoint, ePoint, 0);
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
	CGContextDrawLinearGradient (context, gradient, ePoint, sPoint, 0);
#endif
	
	CGColorSpaceRelease(cspace);
	CGGradientRelease(gradient);
	
	CGContextRestoreGState(context);	
}


// Draws the Badge Frame with Quartz
-(void) drawFrameWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGFloat radius = CGRectGetMaxY(rect)*self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect)*0.10;
	
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
	
	
    CGContextBeginPath(context);
	CGFloat lineSize = 2;
	if(self.badgeScaleFactor>1) {
		lineSize += self.badgeScaleFactor*0.25;
	}
	CGContextSetLineWidth(context, lineSize);
	CGContextSetStrokeColorWithColor(context, [self.badgeFrameColor CGColor]);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextClosePath(context);
	CGContextStrokePath(context);
}


- (void)drawRect:(CGRect)rect {
	
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
	CGContextRef context = UIGraphicsGetCurrentContext();
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
    NSGraphicsContext *nsGraphicsContext = [NSGraphicsContext currentContext];
	CGContextRef context = (CGContextRef)[nsGraphicsContext graphicsPort];
#endif
	[self drawRoundedRectWithContext:context withRect:rect];

	if(self.badgeShining) {
		[self drawShineWithContext:context withRect:rect];
	}

	if (self.badgeFrame)  {
		[self drawFrameWithContext:context withRect:rect];
	}

	if ([self.badgeText length]>0) {
		[badgeTextColor set];
		CGFloat sizeOfFont = 13.5*badgeScaleFactor;
		if ([self.badgeText length]<2) {
			sizeOfFont += sizeOfFont*0.20;
		}
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
		UIFont *textFont = [UIFont boldSystemFontOfSize:sizeOfFont];
		CGSize textSize = [self.badgeText sizeWithFont:textFont];
		[self.badgeText drawAtPoint:CGPointMake((rect.size.width/2-textSize.width/2), (rect.size.height/2-textSize.height/2)) withFont:textFont];
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
		NSFont *textFont = [NSFont boldSystemFontOfSize:sizeOfFont];
        NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:textFont,
                                    NSFontAttributeName, badgeTextColor,
                                    NSForegroundColorAttributeName, nil];
		CGSize textSize = [self.badgeText sizeWithAttributes:attributes];
		[self.badgeText drawAtPoint:CGPointMake((rect.size.width/2-textSize.width/2), (rect.size.height/2-textSize.height/2)) withAttributes:attributes];
#endif
	}
	
}

- (void)dealloc {
	
	[badgeText release];
	[badgeTextColor release];
	[badgeInsetColor release];
	[badgeFrameColor release];	
    [super dealloc];
}


@end
