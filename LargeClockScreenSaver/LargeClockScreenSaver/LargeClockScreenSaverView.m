//
//  LargeClockScreenSaverView.m
//  LargeClockScreenSaver
//
//  Created by Peter Greco on 16/9/19.
//  Copyright © 2019 ___PMENGSERVICES___. All rights reserved.
//

#import "LargeClockScreenSaverView.h"

@implementation LargeClockScreenSaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1];
    }
    
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    [self drawClock];
}

- (void)animateOneFrame
{
    [self drawClock];
    return;
}

- (void) drawClock {
    [[NSColor blackColor] setFill];
    NSRectFill(self.bounds);
    NSDate* date = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    NSFont* font = [NSFont fontWithName:@"Arial" size:self.bounds.size.height/2];
    //NSRect* rect = [[NSRect alloc] init];
    NSRect textRect = font.boundingRectForFont;
    //Horizontal Alignment
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjects:
                                @[font, [NSColor whiteColor], style]
                                                           forKeys:
                                @[NSFontAttributeName, NSForegroundColorAttributeName, NSParagraphStyleAttributeName]];
    //Vertical Alignment, Horizontal Alignment
    [formattedDateString drawAtPoint:NSMakePoint(-textRect.size.width/2+self.bounds.size.width/2, self.bounds.size.height/2-textRect.size.height/2) withAttributes:attributes];
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
