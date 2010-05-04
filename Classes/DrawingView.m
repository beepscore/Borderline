//
//  DrawingView.m
//  Borderline
//
//  Created by Steve Baker on 5/4/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "DrawingView.h"


@implementation DrawingView

#pragma mark properties
@synthesize borderWidth;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}


- (void)dealloc {
    [borderWidth release], borderWidth = nil;
    [super dealloc];
}

- (void)drawRect:(CGRect)rect {
    float fw, fh;
    fw = 100.0;
    fh = 50.0;

    // get graphics context from Cocoa for use by Quartz CoreGraphics.    
    CGContextRef graphicsContext = UIGraphicsGetCurrentContext();

    CGContextSetLineWidth(graphicsContext, [[self borderWidth] floatValue]);
    CGContextBeginPath(graphicsContext);
    CGContextMoveToPoint(graphicsContext, 0.0, 0.0);
    CGContextAddArcToPoint(graphicsContext, fw, fh, fw/2, fh, 10.0);
    CGContextDrawPath(graphicsContext, kCGPathStroke);
    
    
}


@end
