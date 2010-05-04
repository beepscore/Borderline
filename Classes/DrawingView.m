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
@synthesize cornerRadius;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}


- (void)dealloc {
    
    [super dealloc];
}

- (void)drawRect:(CGRect)rect {

    CGPoint arcPoint1, arcPoint2;
    CGFloat arcRadius;

    // get graphics context from Cocoa for use by Quartz CoreGraphics.    
    CGContextRef graphicsContext = UIGraphicsGetCurrentContext();

    CGContextSetLineWidth(graphicsContext, [self borderWidth]);
    CGContextBeginPath(graphicsContext);
    CGContextMoveToPoint(graphicsContext, 0.0, 0.0);
    
    arcPoint1 = CGPointMake(100.0, 50.0);
    arcPoint2 = CGPointMake(arcPoint1.x - 20.0, arcPoint1.y + [self cornerRadius]);
    arcRadius = [self cornerRadius];    
    
    CGContextAddArcToPoint(graphicsContext, arcPoint1.x, arcPoint1.y, 
                           arcPoint2.x, arcPoint2.y, arcRadius);
    
    CGContextDrawPath(graphicsContext, kCGPathStroke);    
    
}


@end
