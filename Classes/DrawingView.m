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

// Ref Gelphman Ch 6 pg 114-115, 132-133
CGMutablePathRef roundedRectPathRef(CGRect rect, CGFloat ovalWidth, CGFloat ovalHeight) {

    CGMutablePathRef tempPath = CGPathCreateMutable(); 

    CGFloat fw, fh;
    // if either ovalWidth or ovalHeight is 0, don't round corners
    if ((0 == ovalWidth) || (0 == ovalHeight)) {
        CGPathAddRect(tempPath, NULL, rect);
    } else {
        
        // Non-uniform scale coordinate system by the oval width and height.
        // In scaled coordinates, each rounded corner is a circular arc of radius = 0.5
        CGAffineTransform transformScale = CGAffineTransformScale(CGAffineTransformIdentity, ovalWidth, ovalHeight);

        // Rectangle width in scaled x coordinate
        fw = CGRectGetWidth(rect) / ovalWidth;
        // Rectangle height in scaled y coordinate
        fh = CGRectGetHeight(rect) / ovalHeight;        
                
        CGFloat scaledRadius = 0.5;
        
        // Start at minimum x,y corner (on iPhone, left top)
        CGPoint arc1Center = CGPointMake(scaledRadius, scaledRadius);        
        // on iPhone, right top
        CGPoint arc2Start  = CGPointMake((fw - scaledRadius), 0);
        CGPoint arc2Center = CGPointMake((fw - scaledRadius), scaledRadius);
        // on iPhone, right bottom
        CGPoint arc3Start  = CGPointMake(fw, (fh - scaledRadius));
        CGPoint arc3Center = CGPointMake((fw - scaledRadius), (fh - scaledRadius));
        // on iPhone, left bottom        
        CGPoint arc4Start  = CGPointMake(scaledRadius, fh);
        CGPoint arc4Center = CGPointMake(scaledRadius, (fh - scaledRadius));
        
        // CGPathMoveToPoint applies transform before move        
        //CGPathMoveToPoint(tempPath, transformScale, arc1Start.x, arc1Start.y);        
        CGPathAddArc(tempPath, &transformScale, arc1Center.x, arc1Center.y, scaledRadius, -M_PI, -M_PI/2, NO);
        
        CGPathAddLineToPoint(tempPath, &transformScale, arc2Start.x, arc2Start.y);        
        CGPathAddArc(tempPath, &transformScale, arc2Center.x, arc2Center.y, scaledRadius, -M_PI/2, 0, NO);

        CGPathAddLineToPoint(tempPath, &transformScale, arc3Start.x, arc3Start.y);        
        CGPathAddArc(tempPath, &transformScale, arc3Center.x, arc3Center.y, scaledRadius, 0, M_PI/2, NO);

        CGPathAddLineToPoint(tempPath, &transformScale, arc4Start.x, arc4Start.y);        
        CGPathAddArc(tempPath, &transformScale, arc4Center.x, arc4Center.y, scaledRadius, M_PI/2, M_PI, NO);

        // Closing the path adds the last segment from arc4 end to arc1 start.
        CGPathCloseSubpath(tempPath);

    }
    return tempPath;
}


void drawBorder(CGContextRef graphicsContext, CGPathRef myPath, CGFloat aBorderWidth) {

    CGContextSaveGState(graphicsContext);

    CGContextBeginPath(graphicsContext);
    CGContextAddPath(graphicsContext, myPath);
    
    CGContextSetLineWidth(graphicsContext, aBorderWidth);
    CGContextSetRGBStrokeColor(graphicsContext, 1.0, 1.0, 1.0, 1.0);
    
    CGContextDrawPath(graphicsContext, kCGPathStroke);
    
    CGContextRestoreGState(graphicsContext);
}


- (void)drawRect:(CGRect)rect {

    // get graphics context from Cocoa for use by Quartz CoreGraphics.    
    CGContextRef graphicsContext = UIGraphicsGetCurrentContext();
    
    CGRect clipRect = CGRectMake(20.0, 20.0, 280.0, 280.0);
    CGFloat ovalWidth = [self cornerRadius];
    CGFloat ovalHeight = ovalWidth;

    CGMutablePathRef myPath = roundedRectPathRef(clipRect, ovalWidth, ovalHeight);

    CGContextSaveGState(graphicsContext);
    
    CGContextAddPath(graphicsContext, myPath);
    CGContextClip(graphicsContext);
    
    
    // CGContextDrawImage ref Gelphman Ch 9 p 207
    // Here we get a CGImageRef from a Cocoa UIImage
    // Alternatively, we could have gotten a CGImageRef from C
    // http://developer.apple.com/iphone/library/documentation/Cocoa/Conceptual/LoadingResources/ImageSoundResources/ImageSoundResources.html
    // Gelphman Ch 8 p 187, Ch 9 p 206    
    CGContextDrawImage(graphicsContext, [self bounds], [self.myImage CGImage]);

    // turn off clipping
    CGContextRestoreGState(graphicsContext);
    
    drawBorder(graphicsContext, myPath, self.borderWidth);

}

@end
