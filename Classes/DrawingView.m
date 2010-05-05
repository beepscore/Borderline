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
@synthesize myImage;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code 
    }
    return self;
}


- (void)dealloc {
    [myImage release], myImage = nil;
    [super dealloc];
}


- (void)drawRect:(CGRect)rect {

    CGPoint arcPoint1, arcPoint2;
    CGFloat arcRadius;

    // get graphics context from Cocoa for use by Quartz CoreGraphics.    
    CGContextRef graphicsContext = UIGraphicsGetCurrentContext();

    // CGContextDrawImage ref Gelphman Ch 9 p 207
    // Here we get a CGImageRef from a Cocoa UIImage
    // Alternatively, we could have gotten a CGImageRef from C
    // http://developer.apple.com/iphone/library/documentation/Cocoa/Conceptual/LoadingResources/ImageSoundResources/ImageSoundResources.html
    // Gelphman Ch 8 p 187, Ch 9 p 206    
    CGContextDrawImage(graphicsContext, [self bounds], [self.myImage CGImage]);
    
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
