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

// Ref Gelphman Ch 6 pg 114-115
void addRoundedRectToPath(CGContextRef context, CGRect rect, CGFloat ovalWidth, CGFloat ovalHeight) {
    
    CGFloat fw, fh;
    // if either ovalWidth or ovalHeight is 0, add a regular rectangle
    if ((0 == ovalWidth) || (0 == ovalHeight)) {
        CGContextAddRect(context, rect);
    } else {
        CGContextSaveGState(context);
        // Translate to lower-left corner of rectangle
        CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
        // Scale by the oval width and height so that
        // each rounded corner is 0.5 units in radius
        CGContextScaleCTM(context, ovalWidth, ovalHeight);
        // Unscale the rectangle width by the amount of the x scaling
        fw = CGRectGetWidth(rect) / ovalWidth;
        // Unscale the rectangle height by the amount of the y scaling
        fh = CGRectGetHeight(rect) / ovalHeight;
        // Start at the right edge of the rectangle, at the midpoint in y
        CGContextMoveToPoint(context, fw, fh/2);
        // Segment 1
        CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 0.5);
        // Segment 2
        CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 0.5);
        // Segment 3
        CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 0.5);
        // Segment 4
        CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 0.5);
        // Closing the path adds the last segment
        CGContextClosePath(context);
        
        CGContextRestoreGState(context);
    }
}


- (void)drawRect:(CGRect)rect {

    CGPoint arcPoint1, arcPoint2;
    CGFloat arcRadius;

    // get graphics context from Cocoa for use by Quartz CoreGraphics.    
    CGContextRef graphicsContext = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(graphicsContext);

    CGRect clipRect = CGRectMake(30.0, 30.0, 220.0, 220.0);
    CGFloat ovalWidth = [self cornerRadius];
    CGFloat ovalHeight = ovalWidth;
    addRoundedRectToPath(graphicsContext, clipRect, ovalWidth, ovalHeight);
    CGContextClip(graphicsContext);
    
    
    // CGContextDrawImage ref Gelphman Ch 9 p 207
    // Here we get a CGImageRef from a Cocoa UIImage
    // Alternatively, we could have gotten a CGImageRef from C
    // http://developer.apple.com/iphone/library/documentation/Cocoa/Conceptual/LoadingResources/ImageSoundResources/ImageSoundResources.html
    // Gelphman Ch 8 p 187, Ch 9 p 206    
    CGContextDrawImage(graphicsContext, [self bounds], [self.myImage CGImage]);
     
    CGContextRestoreGState(graphicsContext);

    
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
